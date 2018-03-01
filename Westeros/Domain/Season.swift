//
//  Season.swift
//  Westeros
//
//  Created by Mirellys on 28/02/2018.
//  Copyright © 2018 Mirellys Arteta Davila. All rights reserved.
//

import Foundation

class Season {
    let name: String
    let dateRelease: Date
    private var _episodes: [Episode]
    
    var episodes: [Episode] {
        get {
            return _episodes
        }
    }
    
    init?(name: String, dateRelease: Date, episodes: [Episode]) {
        guard episodes.count > 0 else { return nil }
        self.name = name
        self.dateRelease = dateRelease
        _episodes = [Episode]()
        
//        _episodes.forEach { episode in
//            episode.season = self
//        }
        
        _episodes.map { [unowned self] episode in
            episode.season = self
        }
    }
}
