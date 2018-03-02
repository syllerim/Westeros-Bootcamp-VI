//
//  RepositoryTests.swift
//  WesterosTests
//
//  Created by Alexandre Freire on 13/02/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Westeros

class RepositoryTests: XCTestCase {
    
    var localHouses: [House]!
    var localSeasons: [Season]!
    
    override func setUp() {
        super.setUp()
        localHouses = Repository.local.houses
        localSeasons = Repository.local.seasons
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLocalRepositoryCreation() {
        let local = Repository.local
        XCTAssertNotNil(local)
    }
    
    //MARK:- Houses Local Repository
    
    func testLocalRepositoryHousesCreation() {
        XCTAssertNotNil(localHouses)
        XCTAssertEqual(localHouses.count, 3)
    }
    
    func testLocalRepositoryReturnsSortedArrayOfHouses() {
        // [2, 5, 6, 10, 18].sorted()
        // [2, 5, 6, 10, 18]
        XCTAssertEqual(localHouses, localHouses.sorted())
    }
    
    func testLocalRepositoryReturnsHouseByCaseInsensitively() {
        let stark = Repository.local.house(named: "sTarK")
        XCTAssertEqual(stark?.name, "Stark")
        
        let keepcoding = Repository.local.house(named: "Keepcoding")
        XCTAssertNil(keepcoding)
    }
    
    func testHouseFiltering() {
        let filtered = Repository.local.houses(filteredBy: { $0.count == 1 })
        XCTAssertEqual(filtered.count, 1)
        
        let otherFilter = Repository.local.houses(filteredBy: { $0.words.contains("invierno")})
        XCTAssertEqual(otherFilter.count, 1)
    }
    
    //MARK:- Seasons Local Repository
    
    func testLocalRepositorySeasinsCreation() {
        XCTAssertNotNil(localSeasons)
        XCTAssertEqual(localSeasons.count, 7)
    }
    
    func testLocalRepositoryReturnsSortedArrayOfSeasons() {
        XCTAssertEqual(localSeasons, localSeasons.sorted())
    }
    
    func testLocalRepositoryReturnsSeasonByCaseInsensitively() {
        let season1: Season! = Repository.local.season(named: "seAson 1")
        XCTAssertEqual(season1.name, "Season 1")
        
        let other = Repository.local.season(named: "Other")
        XCTAssertNil(other)
    }
    
    func testSeasonFiltering() {
        let filteredByName = Repository.local.seasons(filteredBy: { $0.name.contains("son") })
        XCTAssertEqual(filteredByName.count, 7)
        
        let filteredByDateRelease = Repository.local.seasons(filteredBy: { $0.dateRelease == Date(dateString: "2011-04-17") })
        XCTAssertEqual(filteredByDateRelease.count, 1)
        
        let filteredByNumEpisodes = Repository.local.seasons(filteredBy: { $0.episodes.count == 10 })
        XCTAssertEqual(filteredByNumEpisodes.count, 6)
    }
}



















