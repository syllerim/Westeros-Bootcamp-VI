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
        
        var episodes = [Episode]()
        episodes.append(episode1)
        episodes.append(episode2)
        
        season1 = Season(name: "Season 1", dateRelease: Date(dateString: "2011-04-17"), episodes: episodes)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEpisodeExits(){
        XCTAssertNotNil(episode1)
    }
    
    func testEpisodeWithoutSeason() {
        XCTAssertNil(episode1.season)
    }
    
    func testEpisodeNameValid() {
        season1.episodes.forEach { ep in
            XCTAssertEqual(ep.season.name, episode1.season.name)
        }
    }
    
    func testEpisodeTitleValid(){
        season1.episodes.forEach { ep in
            XCTAssertEqual(ep.title, episode1.title)
        }
    }
    
    func testEpisodeDescription() {
        XCTAssertEqual(episode1.description, "\(episode1.title) - \(episode1.broadcastDate.toString)")
    }
    
    func testEpisodeEquality() {
        //Test Indentity
        XCTAssertEqual(episode1, episode1)
        
        //Test Equality
        let episodeX = Episode(title: "Winter Is Coming", broadcastDate: Date(dateString: "2011-04-17"))
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
