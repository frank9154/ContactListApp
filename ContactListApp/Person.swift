//
//  Person.swift
//  ContactListApp
//
//  Created by Александр Соколов on 16.12.2023.
//

struct Person {
    let fullName: String
    let email: String
    let phone: String
}

class DataStore {
    private let firstNames = ["John", "Rudy", "Alex", "Julia", "Meg", "Emma", "Michael", "Sophia"]
    private let lastNames = ["Smith", "Cooper", "Martinez", "Watson", "Willis", "Ryan", "Scott", "Turner"]
    
    private var uniqueEmails = Set<String>()
    private var uniquePhones = Set<String>()
       

    
}


