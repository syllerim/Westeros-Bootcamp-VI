//
//  Season.swift
//  Westeros
//
//  Created by Mirellys on 28/02/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import Foundation

class Season {
    let numberOfEpisodes: Int
    let name: String
    let dateRelease: Date
    
    init?(numberOfEpisodes: Int, name: String, dateRelease: Date) {
        if numberOfEpisodes > 0 {
            self.numberOfEpisodes = numberOfEpisodes
            self.name = name
            self.dateRelease = dateRelease
        }
        else {
            return nil
        }
    }
}
