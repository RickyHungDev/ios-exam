//
//  Person.swift
//  iOS-exam
//
//  Created by Hung Ricky on 2018/7/31.
//  Copyright © 2018年 Hung Ricky. All rights reserved.
//

import Foundation

struct Person: Codable {
    let firstName: String?
    let lastName: String?
    let birthday: String?
    var age: String?
    let email: String?
    let mobileNumber: String?
    let address: String?
    let contactPerson: String?
    let contactPersonPhoneNumber: String?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "firstName"
        case lastName = "lastName"
        case birthday = "birthday"
        case age = "age"
        case email = "email"
        case mobileNumber = "mobileNumber"
        case address = "address"
        case contactPerson = "contactPerson"
        case contactPersonPhoneNumber = "contactPersonPhoneNumber"
    }
    
    init(firstName: String? = nil, lastName: String? = nil, birthday: String? = nil, age: String? = nil, email: String? = nil, mobileNumber: String? = nil, address: String? = nil, contactPerson: String? = nil, contactPersonPhoneNumber: String? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthday = birthday
        self.age = age
        self.email = email
        self.mobileNumber = mobileNumber
        self.address = address
        self.contactPerson = contactPerson
        self.contactPersonPhoneNumber = contactPersonPhoneNumber
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        firstName = try values.decode(String.self, forKey: .firstName)
        lastName = try values.decode(String.self, forKey: .lastName)
        birthday = try values.decode(String.self, forKey: .birthday)
        age = try? values.decode(String.self, forKey: .age)
        if age == nil {
            if let birthday = birthday, let date = DateConvert.dateFromString(dateString: birthday) {
                age = DateConvert.dateToAge(with: date)
            }
        }
        email = try values.decode(String.self, forKey: .email)
        mobileNumber = try values.decode(String.self, forKey: .mobileNumber)
        address = try values.decode(String.self, forKey: .address)
        contactPerson = try values.decode(String.self, forKey: .contactPerson)
        contactPersonPhoneNumber = try values.decode(String.self, forKey: .contactPersonPhoneNumber)
    }
}

struct PersonDataStore: Codable {
    var persons: [Person]
}
