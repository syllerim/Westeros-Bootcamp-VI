//
//  Season.swift
//  Westeros
//
//  Created by Mirellys on 28/02/2018.
//  Copyright © 2018 Mirellys Arteta Davila. All rights reserved.
//

import UIKit

typealias Episodes = Set<Episode>

class Season {
    let name: String
    let dateRelease: Date
    let summary: String
    let image: UIImage
    private var _episodes: Episodes
    
    var episodes: Episodes {
        get {
            return _episodes
        }
    }
    
    init?(name: String, dateRelease: Date, summary: String, image: UIImage, episodes: Episodes) {
        guard episodes.count > 0 else { return nil }
        self.name = name
        self.dateRelease = dateRelease
        self.summary = summary
        self.image = image
        self._episodes = Episodes()
        
        add(episodes: episodes)
    }
}

extension Season {
    var count: Int {
        return _episodes.count
    }
    
    var sortedEpisodes: [Episode] {
        return _episodes.sorted()
    }
    
    func add(episode: Episode) {
        episode.season = self
        _episodes.insert(episode)
    }
    
    func add(episodes: Episode...) {
        episodes.forEach{ add(episode: $0) }
    }
    
    func add(episodes: Episodes) {
        episodes.forEach{ add(episode: $0) }
    }
}

extension Season: CustomStringConvertible {
    var description: String {
        return "\(name) - \(dateRelease.toString)"
    }
}

extension Season {
    
    var proxyForEquality: Int {
        var hash = 5381
        hash = ((hash << 5) &+ hash) &+ name.hashValue
        hash = ((hash << 5) &+ hash) &+ dateRelease.hashValue
        hash = episodes.reduce(hash) { (($0 << 5) &+ $0) &+ $1.hashValue }
        return hash
    }
    
    var proxyForComparison: String {
        return dateRelease.toString.uppercased()
    }
}

extension Season: Equatable {
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension Season: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

extension Season: Comparable {
    static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
