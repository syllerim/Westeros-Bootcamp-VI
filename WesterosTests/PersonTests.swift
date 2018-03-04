//
//  CharacterTests.swift
//  WesterosTests
//
//  Created by Alexandre Freire on 08/02/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTests: XCTestCase {
    
    var starkHouse: House!
    var lannisterHouse: House!
    
    override func setUp() {
        super.setUp()
        starkHouse = Repository.local.house(name: .stark)
        lannisterHouse = Repository.local.house(name: .lannister)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCharacterExistence() {
        let robb = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        
        XCTAssertNotNil(robb)
        XCTAssertNotNil(arya)
    }
    
    func testFullName() {
        let robb = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse)
        XCTAssertEqual(robb.fullName, "Robb Stark")
    }
    
    func testPersonEquality() {
        // Identidad
        let tyrion = Person(name: "Tyrion", alias: "El Enano", house: lannisterHouse)
        XCTAssertEqual(tyrion, tyrion)
        
        // Igualdad
        let enano = Person(name: "Tyrion", alias: "El Enano", house: lannisterHouse)
        XCTAssertEqual(enano, tyrion)
        
        // Desigualdad
        let arya = Person(name: "Arya", house: starkHouse)
        XCTAssertNotEqual(tyrion, arya)
    }
    
    
}
