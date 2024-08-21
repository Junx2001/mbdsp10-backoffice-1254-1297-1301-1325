package com.itu.mbds

import grails.mongodb.MongoEntity
import org.bson.types.ObjectId

import java.text.ParseException
import java.text.SimpleDateFormat

class Rating implements MongoEntity<Rating> {
    static mapWith = "mongodb"
    ObjectId id
    int userId
    int concerned_user_id
    String review
    Double rating

    static constraints = {
        id nullable: false
        userId nullable: false
        concerned_user_id nullable: false
        review nullable: true
        rating nullable: false
    }
    static mapping = {
        id attr: '_id'
        collection 'ratings'
        version false
    }
    User getUser(){
        return User.get(this.userId)
    }
    User getConcernedUser(){
        return User.get(this.concerned_user_id)
    }
}