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
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = Locale(identifier: "en_US_POSIX")
        let d = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:d)
    }
    

}
