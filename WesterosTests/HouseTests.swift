//
//  HouseTests.swift
//  WesterosTests
//
//  Created by Alexandre Freire on 08/02/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Westeros

class HouseTests: XCTestCase {
    
    var starkHouse: House!
    var lannisterHouse: House!
    var targaryenHouse: House!
    
    override func setUp() {
        super.setUp()
        
        starkHouse = Repository.local.house(name: .stark)
        lannisterHouse =  Repository.local.house(name: .lannister)
        targaryenHouse = Repository.local.house(name: .targaryen)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testHouseExistence() {
        XCTAssertNotNil(starkHouse)
        XCTAssertNotNil(lannisterHouse)
    }
    
    func testSigilExistence() {
        XCTAssertNotNil(starkHouse.sigil)
        XCTAssertNotNil(lannisterHouse.sigil)
    }

    func testAddPersons() {
        //Test for data loaded in memory
//        XCTAssertEqual(starkHouse.count, 2)
//        XCTAssertEqual(lannisterHouse.count, 3)
//
//        let _ = Person(name: "Viserys", house: targaryenHouse)
//        XCTAssertEqual(targaryenHouse.count, 2)
        
        //Test from JSON
        XCTAssertEqual(starkHouse.count, 6)
        XCTAssertEqual(lannisterHouse.count, 2)
        
        let _ = Person(name: "Viserys", house: targaryenHouse)
        XCTAssertEqual(targaryenHouse.count, 9)
    }

    func testHouseEquality() {
        // Identidad
        XCTAssertEqual(starkHouse, starkHouse)

        // Igualdad
        let sg = Sigil(image: "codeIsComing.png", description: "Lobo Huargo")
        let sh = House(name: .stark, sigil: sg, words: "Se acerca el invierno", url: "https://awoiaf.westeros.org/index.php/House_Stark")
        let _ = Person(name: "Arya", house: sh)
        let _ = Person(name: "Robb", alias: "El Joven Lobo", house: sh)
        
        let jinxed = House(name: .stark, sigil: sg, words: "Se acerca el invierno", url: "https://awoiaf.westeros.org/index.php/House_Stark" )
        let _ = Person(name: "Robb", alias: "El Joven Lobo", house: jinxed)
        let _ = Person(name: "Arya", house: jinxed)
        
        XCTAssertEqual(sh, jinxed)

        // Desigualdad
        XCTAssertNotEqual(starkHouse, lannisterHouse)
    }

    func testHashable() {
        XCTAssertNotNil(starkHouse.hashValue)
    }

    func testHouseComparison() {
        XCTAssertLessThan(lannisterHouse, starkHouse)
    }

    func testHouseReturnsSortedArrayOfMembers() {
        let starkSigil = Sigil(image: "codeIsComing.png", description: "Lobo Huargo")
        let starkHouse = House(name: .stark, sigil: starkSigil, words: "Se acerca el invierno", url: "https://awoiaf.westeros.org/index.php/House_Stark")
        let arya = Person(name: "Arya", house: starkHouse)
        let robb = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse)
        
        XCTAssertEqual(starkHouse.sortedMembers, [arya, robb])
    }
    
}





































