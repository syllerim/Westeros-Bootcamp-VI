//
//  Episode.swift
//  Westeros
//
//  Created by Mirellys on 01/03/2018.
//  Copyright © 2018 Mirellys Arteta Davila. All rights reserved.
//

import Foundation

class Episode {
    let title: String
    let broadcastDate: Date
    weak var season: Season!
    
    init(title: String, broadcastDate: Date, season: Season? = nil) {
        self.title = title
        self.broadcastDate = broadcastDate
        self.season = season
    }
}
