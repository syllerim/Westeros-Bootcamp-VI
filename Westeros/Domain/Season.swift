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
        
        _episodes.forEach { episode in
            episode.season = self
        }
    }
}

extension Season: CustomStringConvertible {
    var description: String {
        let episodesDescription = _episodes.reduce("- ") { $0.description + $1.description }
        return "\(name) - \(dateRelease.toString)\(episodesDescription)"
    }
}

extension Season {
    var proxyEquatable: String {
        return description
    }
    var proxyForComparison: String {
        return dateRelease.toString.uppercased()
    }
}

extension Season: Equatable {
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyEquatable == rhs.proxyEquatable
    }
}

extension Season: Hashable {
    var hashValue: Int {
        return proxyEquatable.hashValue
    }
}

extension Season: Comparable {
    static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
