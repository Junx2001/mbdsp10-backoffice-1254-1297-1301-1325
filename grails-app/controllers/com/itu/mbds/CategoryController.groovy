package com.itu.mbds

import grails.plugin.springsecurity.annotation.Secured

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
    def show(Long id) {
        def category = categoryService.get(id)
        if (category == null) {
            notFound()
            return
        }
        respond category
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
