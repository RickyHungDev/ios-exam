//
//  DateConvert.swift
//  iOS-exam
//
//  Created by Hung Ricky on 2018/7/31.
//  Copyright © 2018年 Hung Ricky. All rights reserved.
//

import Foundation

class DateConvert {
    class func dateToAge(with birthday: Date) -> String {
        let currentDate = Date()
        let time = currentDate.timeIntervalSince(birthday)
        let age = Int(time/(3600*24*365))
        return String(age)
    }
    
    class func dateFromString(dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let date = dateFormatter.date(from: dateString)
        return date
    }
}
