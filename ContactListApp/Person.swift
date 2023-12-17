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
    
    func generateRandomPerson() -> Person {
        let firstName = firstNames.randomElement() ?? "Unknown"
        let lastName = lastNames.randomElement() ?? "Unknown"
        let email = generateUniqueEmail()
        let phone = generateUniquePhone()
        return Person(fullName: "\(firstName) \(lastName)", email: email, phone: phone)
    }
    
    private func generateUniqueEmail() -> String {
        var email = ""
        repeat {
            email = "\(randomString(length: 7))@example.com"
        } while uniqueEmails.contains(email)
        uniqueEmails.insert(email)
        return email
    }
    
    private func generateUniquePhone() -> String {
        var phone = ""
        repeat {
            phone = String(format: "+1%010d", Int.random(in: 0...9999999999))
        } while uniquePhones.contains(phone)
        uniquePhones.insert(phone)
        return phone
    }
    
    private func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyz"
        return String((0..<length).map{ _ in letters.randomElement()!})
    }
    
}


