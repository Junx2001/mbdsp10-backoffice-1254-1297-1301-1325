package com.itu.mbds

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import org.springframework.web.multipart.MultipartFile

import static org.springframework.http.HttpStatus.CREATED
import static org.springframework.http.HttpStatus.NOT_FOUND
import static org.springframework.http.HttpStatus.OK


class UserController {
    UserService userService
    SpringSecurityService springSecurityService

    @Secured(['ROLE_ADMIN','ROLE_SUPER_ADMIN'])
    def index(Integer maxRecords) {
        params.maxRecords = Math.min(maxRecords ?: 10, 100)
        params.sort = "dateCreated"
        params.order = "desc"
        respond userService.list(params), model:[userCount: userService.count()]
    }
    @Secured(['ROLE_SUPER_ADMIN'])
    def create() {
        respond new User(params), model:[roles:Role.list()]
    }
    @Secured(['ROLE_SUPER_ADMIN'])
    def save(User user) {
        if (user == null) {
            notFound()
            return
        }
        try {
            // Getting the file from the form
            /*MultipartFile f = request.getFile('image')
            if (f != null && !f.empty) {
                // Define the target directory and filename
                String originalFilename = "${new Date().getTime()}_${f.originalFilename}"
                // Get the path of illustration - path inside application.groovy
                String mainPath = grailsApplication.config.illustrations.path
                File targetDir = new File(mainPath)
                // Create the directory if it does not exist
                if (!targetDir.exists()) {
                    targetDir.mkdirs()
                }
                // Define the target file
                File targetFile = new File(targetDir, originalFilename)
                // Transfer the file to the target location
                f.transferTo(targetFile)

                // Affect user image to the name of the file
                user.user_image = originalFilename
            }*/
            user.role = Role.get(params.role)
            userService.save(user)
        } catch (ValidationException e) {
            respond user.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect method:"GET", action: "show", id: user.id
            }
            '*' { respond method:"GET", action: "show", id: user.id, [status: CREATED] }
        }
    }
    @Secured(['ROLE_ADMIN','ROLE_SUPER_ADMIN'])
    def show(Long id) {
        def user = userService.get(id)
        if (user == null) {
            notFound()
            return
        }
        def propositions = Proposition.findAllByUser(user,[sort: "creationDate", order: "desc"])

        def exchangeList = user.getAllExchanges();
        def transactionList = Transaction.findAllByOwner_idOrTaker_id(user.id as int, user.id as int,[sort: "creation_date", order: "desc"])
        def ratingList = Rating.findAllByConcerned_user_id(user.id as int)

        respond user, model:[exchangeList: exchangeList, transactionList: transactionList, ratingList :ratingList]
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    @Secured(['ROLE_SUPER_ADMIN'])
    def moderateAccount(User user) {
        if (user == null) {
            notFound()
            return
        }
        def propositions = Proposition.findAllByUser(user,[sort: "creationDate", order: "desc"])
        def transactionList = Transaction.findAllByOwner_idOrTaker_id(user.id,user.id,[sort: "creation_date", order: "desc"])
        try {
            user = user.moderateAccount(user, params.moderateAction)
            if (!userService.save(user)) {
                log.error "User save failed: ${user.errors}"
                throw new ValidationException("Failed to save user", user.errors)
            }
            if(user.equals(getAuthenticatedUser())){
                if(springSecurityService.isLoggedIn()){
                    springSecurityService.reauthenticate(user.username)
                }
            }
        } catch (ValidationException e) {
            println(e);
            respond user.errors, view:'show', model:[propositionList: propositions, transactionList: transactionList]
            return
        }
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect method:"GET", action: "show", id: user.id
            }
            '*'{ respond method:"GET", action: "show", id: user.id, [status: OK] }
        }
    }
}
