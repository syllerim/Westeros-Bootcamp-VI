//
//  Character.swift
//  Westeros
//
//  Created by Alexandre Freire on 08/02/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import Foundation

final class Person: Decodable {
    let name: String
    let house: House
    private let _alias: String?
    
    var alias: String {
        return _alias ?? ""
    }
    
    init(name: String, alias: String? = nil, house: House) {
        self.name = name
        _alias = alias
        self.house = house
        self.house.add(person: self)
    }
    
    enum PersonKeys: String, CodingKey {
        case name
        case alias = "alias"
        case house
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: PersonKeys.self)
        name = try values.decode(String.self, forKey: .name)
        _alias = try? values.decode(String.self, forKey: .alias)
        house = try values.decode(House.self, forKey: .house)
        
        self.house.add(person: self)
    }
}

extension Person {
    var fullName: String {
        return "\(name) \(house.name.rawValue)"
    }
}

// MARK: - Proxies
extension Person {
    var proxyForEquality: String {
        return "\(name) \(alias) \(house.name)"
    }
    
    var proxyForComparison: String {
        return fullName
    }
}

// MARK: - Hashable
extension Person: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

// MARK: - Equatable
extension Person: Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

// MARK: - Comparable
extension Person: Comparable {
    static func <(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
