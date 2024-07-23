package com.itu.mbds

class Exchange {
    String status
    Date creationDate = new Date()
    Date updatingDate = new Date()
    Proposition ownerProposition
    Proposition takerProposition

    static constraints = {
        status nullable: false, blank: false
        ownerProposition nullable: false, blank:false
        takerProposition nullable: false, blank:false
        creationDate nullable: false,date: true, default: new Date()
        updatingDate nullable: false,date:true, default: new Date()
    }
    static mapping = {
        creationDate column: 'creation_date'
        updatingDate column: 'updated_date'
        ownerProposition column: 'owner_proposition_id'
        takerProposition column: 'taker_proposition_id'
        version false
    }
}
