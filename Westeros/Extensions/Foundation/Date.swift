//
//  Date+Additions.swift
//  Westeros
//
//  Created by Mirellys on 01/03/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import Foundation

extension Date {

    init(dateString:String) {
        let d = Date.formatter.date(from: dateString)!
        self.init(timeInterval:0, since:d)
    }
    
    var toString: String {
        return Date.formatter.string(from: self)
    }
    
    static var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }

}
