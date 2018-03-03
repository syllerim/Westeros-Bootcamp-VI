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
    let summary: String
    weak var season: Season!
    
    init(title: String, broadcastDate: Date, summary: String, season: Season? = nil) {
        self.title = title
        self.broadcastDate = broadcastDate
        self.summary = summary
        self.season = season
    }
}

extension Episode: CustomStringConvertible {
    var description: String {
        var result = "\(title) - \(broadcastDate.toString)"
        if let season = season {
            result += season.description
        }
        return result
    }
}

extension Episode {
    var proxyForEquality: Int {
        var hash = 5381
        hash = ((hash << 5) &+ hash) &+ title.hashValue
        hash = ((hash << 5) &+ hash) &+ broadcastDate.hashValue
        return hash
    }
    
    var proxyForComparison: String {
        return broadcastDate.toString
    }
}

extension Episode: Equatable {
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension Episode: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

extension Episode: Comparable {
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
