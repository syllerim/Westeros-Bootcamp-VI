//
//  SeasonTests.swift
//  WesterosTests
//
//  Created by Mirellys on 28/02/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import XCTest
import UIKit

@testable import Westeros

class SeasonTests: XCTestCase {
    var season1: Season!
    var season2: Season!
    var episode1: Episode!
    
    override func setUp() {
        super.setUp()
        
        season1 = Repository.local.season(named: "Season 1")
        season2 = Repository.local.season(named: "Season 2")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSeasonExistence() {
        XCTAssertNotNil(season1)
    }
    
    func testSeasonNotExistence() {
        let season = Season(name: "Season 1",
                            dateRelease: Date(dateString: "2011-04-17"),
                            summary: "test",
                            image: #imageLiteral(resourceName: "got-season1.jpg"),
                            episodes: Set<Episode>())
        XCTAssertNil(season)
    }
    
    func testSeasonDescription() {
        XCTAssertNotNil(season1.description)
    }
    
    func testSeasonEquality() {
        //Test identity
        XCTAssertEqual(season1, season1)

        //Test Equality
        let episodeX = Episode(title: "Winter Is Coming", broadcastDate: Date(dateString: "2011-04-17"), summary: "text")
        let episodeY = Episode(title: "Winter Is Coming", broadcastDate: Date(dateString: "2011-04-17"), summary: "text")
        
        let seasonX: Season! = Season(name: "Season 1", dateRelease: Date(dateString: "2011-04-17"), summary: "text", image: #imageLiteral(resourceName: "got-season1.jpg"), episodes: Set<Episode>(arrayLiteral: episodeX))
        let seasonY: Season! = Season(name: "Season 1", dateRelease: Date(dateString: "2011-04-17"), summary: "text", image: #imageLiteral(resourceName: "got-season1.jpg"), episodes: Set<Episode>(arrayLiteral: episodeY))
        
        XCTAssertEqual(seasonX, seasonY)
        
        //Test UnEquality
        XCTAssertNotEqual(season1, season2)
    }

    func testSeasonHashable() {
        XCTAssertNotNil(season1.hashValue)
    }

    func testSeasonComapable() {
        XCTAssertLessThan(season1, season2)
    }
    
}
