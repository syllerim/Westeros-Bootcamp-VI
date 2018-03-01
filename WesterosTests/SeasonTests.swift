//
//  SeasonTests.swift
//  WesterosTests
//
//  Created by Mirellys on 28/02/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Westeros

class SeasonTests: XCTestCase {
    var season: Season!
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSeasonExistence() {
        season = Season(numberOfEpisodes: 1, name: "Season 1", dateRelease: Date())
        XCTAssertNotNil(season)
    }
    
    func testSeasonNotExistence() {
        season = Season(numberOfEpisodes: 0, name: "Season 1", dateRelease: Date())
        XCTAssertNil(season)
    }
}
