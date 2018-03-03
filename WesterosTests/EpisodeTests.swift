//
//  EpisodeTests.swift
//  WesterosTests
//
//  Created by Mirellys on 01/03/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Westeros

class EpisodeTests: XCTestCase {

    var episode1: Episode!
    var episode2: Episode!
    var season1: Season!
    
    override func setUp() {
        super.setUp()

        episode1 = Episode(title: "Winter Is Coming", broadcastDate: Date(dateString: "2011-04-17"))
        episode2 = Episode(title: "The Kinkgsroad", broadcastDate: Date(dateString: "2011-04-24"))
        
        var episodes = Set<Episode>()
        episodes.insert(episode1)
        episodes.insert(episode2)
        
        season1 = Season(name: "Season 1", dateRelease: Date(dateString: "2011-04-17"), summary: "", image: #imageLiteral(resourceName: "got-season1.jpg"), episodes: episodes)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEpisodeExits(){
        XCTAssertNotNil(episode1)
    }
    
    func testEpisodeWithoutSeason() {
        let episode = Episode(title: "Winter Is Coming", broadcastDate: Date(dateString: "2011-04-17"))
        XCTAssertNil(episode.season)
    }
    
    func testEpisodeNameValid() {
        season1.episodes.forEach { ep in
            XCTAssertEqual(ep.season.name, episode1.season.name)
        }
    }
    
    func testEpisodeDescription() {
        XCTAssertNotNil(episode1.description)
    }
    
    func testEpisodeEquality() {
        //Test Indentity
        XCTAssertEqual(episode1, episode1)
        
        //Test Equality
        let episodeX = Episode(title: "Winter Is Coming", broadcastDate: Date(dateString: "2011-04-17"), season: season1)
        XCTAssertEqual(episode1, episodeX)
        
        //Test UnEquality
        XCTAssertNotEqual(episode1, episode2)
    }
    
    func testEpisodeHashable() {
        XCTAssertNotNil(episode1.hashValue)
    }
    
    func testEpisodeComapable() {
        XCTAssertLessThan(episode1, episode2)
    }
}
