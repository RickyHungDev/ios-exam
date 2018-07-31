//
//  PersonExtension.swift
//  iOS-exam
//
//  Created by Hung Ricky on 2018/7/31.
//  Copyright © 2018年 Hung Ricky. All rights reserved.
//

import Foundation

extension Person {
    func personToArray() -> [[String?]] {
        var personDataArray: [[String?]] = []
        personDataArray.append([ParameterName.firstName.rawValue,
                                ParameterName.lastName.rawValue,
                                ParameterName.birthday.rawValue,
                                ParameterName.age.rawValue,
                                ParameterName.email.rawValue,
                                ParameterName.mobileNumber.rawValue,
                                ParameterName.address.rawValue,
                                ParameterName.contactPerson.rawValue,
                                ParameterName.contactPersonPhoneNumber.rawValue])
        personDataArray.append([self.firstName,
                                self.lastName,
                                self.birthday,
                                self.age,
                                self.email,
                                self.mobileNumber,
                                self.address,
                                self.contactPerson,
                                self.contactPersonPhoneNumber])
        
        return personDataArray
    }
}
