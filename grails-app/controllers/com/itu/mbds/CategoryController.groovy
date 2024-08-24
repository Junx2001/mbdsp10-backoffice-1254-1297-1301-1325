package com.itu.mbds

import grails.plugin.springsecurity.annotation.Secured

import javax.validation.ValidationException

import static org.springframework.http.HttpStatus.NOT_FOUND

@Secured(['ROLE_ADMIN','ROLE_SUPER_ADMIN'])
class CategoryController {
    CategoryService categoryService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.sort = "createdAt"
        params.order = "desc"
        def categoryList = flash.search ? flash.searchResults : categoryService.list(params)
        def categoryCount = flash.search ? flash.searchResults.size() : categoryService.count()

        respond categoryList, model:[categoryCount: categoryCount]

    }
    def create() {
        respond new Category(params)
    }

    def save(Category category) {
        if (category == null) {
            notFound()
            return
        }
        try {
            category.createdAt = new Date()
            category.updatedAt = new Date()
            categoryService.save(category)
        } catch (ValidationException e) {
            respond category.errors, view: 'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'category.label', default: 'Category'), category.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
    def edit(Long id) {
        respond categoryService.get(id)
    }
    def update(Category category) {
        if (category == null) {
            notFound()
            return
        }
        try {
            category.updatedAt = new Date()
            categoryService.save(category)
        } catch (ValidationException e) {
            println(e);
            respond category.errors, view:'edit'
            return
        }
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'category.label', default: 'Category'), category.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }
    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }
        categoryService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'category.label', default: 'Category'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'category.label', default: 'Product'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
