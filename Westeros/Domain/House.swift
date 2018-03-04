//
//  House.swift
//  Westeros
//
//  Created by Alexandre Freire on 08/02/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

typealias Words = String
typealias Members = Set<Person>

enum HouseName: String {
    case stark = "Stark"
    case lannister = "Lannister"
    case targaryen = "Targaryen"
    case tyrell = "Tyrell"
}

// MARK: - House
final class House: Decodable {
    let name: HouseName
    let sigil: Sigil
    let words: Words
    let wikiURL: String
    private var _members: Members
    
    init(name: HouseName, sigil: Sigil, words: Words, url: String) {
        self.name = name
        self.sigil = sigil
        self.words = words
        self.wikiURL = url
        _members = Members()
    }
    
    enum HouseKeys: String, CodingKey {
        case name
        case words
        case url = "url"
        case sigil
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: HouseKeys.self)
        let nameValue = try values.decode(String.self, forKey: .name)
        name = HouseName(rawValue: nameValue)!
        words = try values.decode(String.self, forKey: .words)
        wikiURL = try values.decode(String.self, forKey: .url)
        sigil = try values.decode(Sigil.self, forKey: .sigil)
        _members = Members()
    }
}

extension House {
    var count: Int {
        return _members.count
    }
    
    var sortedMembers: [Person] {
        return _members.sorted()
    }
    
    func add(person: Person) {
        _members.insert(person)
    }
    
}

// MARK: - Proxy
extension House {
    var proxyForEquality: String {
        return "\(name.rawValue) \(words) \(count)"
    }
    
    var proxyForComparison: String {
        return name.rawValue.uppercased() // Alexander > Alexandre
    }
}

// MARK: - Equatable
extension House: Equatable {
    static func ==(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

// MARK: - Hashable
extension House: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

// MARK: - Comparable
extension House: Comparable {
    static func <(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}


// MARK: - Sigil
final class Sigil: Decodable {
    let description: String
    let image: String
    
    init(image: String, description: String) {
        self.image = image
        self.description = description
    }
    
    enum SigilKeys: String, CodingKey {
        case image
        case description
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: SigilKeys.self)
        image = try values.decode(String.self, forKey: .image)
        description = try values.decode(String.self, forKey: .description)
    }
    
}
