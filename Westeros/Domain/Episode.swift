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
    var proxyForEquatable: String {
        return description
    }
    
    var proxyForComparison: String {
        return broadcastDate.toString
    }
}

extension Episode: Equatable {
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForEquatable == rhs.proxyForEquatable
    }
}

extension Episode: Hashable {
    var hashValue: Int {
        return proxyForEquatable.hashValue
    }
}

extension Episode: Comparable {
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
