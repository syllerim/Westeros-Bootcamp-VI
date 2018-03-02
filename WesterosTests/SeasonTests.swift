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
        
        episode1 = Episode(title: "Winter Is Coming", broadcastDate: Date(dateString: "2011-04-17"))
        season1 = Season(name: "Season 1", dateRelease: Date(dateString: "2011-04-17"), episodes: [episode1])
        season2 = Season(name: "Season 2", dateRelease: Date(dateString: "2012-04-17"), episodes: [episode1])
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
                            episodes: [Episode]())
        XCTAssertNil(season)
    }
    
    func testSeasonDescription() {
        let season2 = Season(name: "Season 1", dateRelease: Date(dateString: "2011-04-17"), episodes: [episode1])
        XCTAssertEqual(season1.description, season2?.description)
    }
    
    func testSeasonEquality() {
        //Test identity
        XCTAssertEqual(season1, season1)
        
        //Test Equality
        let seasonX = Season(name: "Season 1", dateRelease: Date(dateString: "2011-04-17"), episodes: [episode1])
        XCTAssertEqual(season1, seasonX)
        
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
