package com.itu.mbds

class Category {

    String categoryName
    Date createdAt
    Date updatedAt

    static constraints = {
        categoryName nullable: false, blank: false, unique: true
        createdAt nullable: true
        updatedAt nullable: true
    }

    static mapping = {
        table '`Categories`'
        categoryName column: '`category_name`'
        createdAt column: '`createdAt`',date: true, default: new Date()
        updatedAt column: '`updatedAt`',date: true, default: new Date()
        version false
    }
    Set<Product> getProducts(){
        (ProductCategory.findAllByCategory(this) as List<ProductCategory>)*.product as Set<Product>
    }
}
