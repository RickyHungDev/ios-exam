//
//  Config.swift
//  iOS-exam
//
//  Created by Hung Ricky on 2018/7/31.
//  Copyright © 2018年 Hung Ricky. All rights reserved.
//

import Foundation

struct SegueID {
    static let personDetail         = "goPersonDetail"
}

struct CellID {
    static let person               = "PersonsCell"
    static let personDetail         = "PersonDetailCell"
}

enum ErrorMessage: String {
    case getData                    = "Get data error"
    case noDataResponse             = "URL response no data."
    case urlNull                    = "URL Error."
    case unknown                    = "Unknown"
}

enum ParameterName: String {
    case firstName                  = "First Name"
    case lastName                   = "Last Name"
    case birthday                   = "Birthday"
    case age                        = "Age"
    case email                      = "Email"
    case mobileNumber               = "Mobile Number"
    case address                    = "Address"
    case contactPerson              = "Contact Person"
    case contactPersonPhoneNumber   = "Contact Person Phone Number"
}

struct RequestURL {
    // TODO: input person server url there
    static let server               = "http://mock.com"
    
    static let testPersonJson = "{\"persons\": [{\"firstName\": \"YiChuan1\", \"lastName\": \"Hung\", \"birthday\": \"1990-01-31\", \"email\": \"hung@ios.exam\", \"mobileNumber\": \"88612345678\", \"address\": \"earth earth earth earth earth earth earth earth earth earth earth earth earth earth\", \"contactPerson\": \"contact me\", \"contactPersonPhoneNumber\": \"88687654321\"},{\"firstName\": \"YiChuan2\", \"lastName\": \"Hung\", \"birthday\": \"1991-02-28\", \"email\": \"hung2@ios.exam\", \"mobileNumber\": \"88612345678\", \"address\": \"Venus\", \"contactPerson\": \"contact me\", \"contactPersonPhoneNumber\": \"88687654321\"},{\"firstName\": \"YiChuan3\", \"lastName\": \"Hung\", \"birthday\": \"1992-03-31\", \"email\": \"hung@ios.exam\", \"mobileNumber\": \"88612345678\", \"address\": \"earth\", \"contactPerson\": \"contact me\", \"contactPersonPhoneNumber\": \"88687654321\"},{\"firstName\": \"YiChuan4\", \"lastName\": \"Hung\", \"birthday\": \"1993-04-30\", \"email\": \"hung@ios.exam\", \"mobileNumber\": \"88612345678\", \"address\": \"earth\", \"contactPerson\": \"contact me\", \"contactPersonPhoneNumber\": \"88687654321\"}] }".data(using: String.Encoding.utf8)!
}
