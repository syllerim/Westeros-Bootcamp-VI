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

    var episode: Episode!
    var season: Season!
    
    override func setUp() {
        super.setUp()

        episode = Episode(title: "Winter Is Coming", broadcastDate: Date(dateString: "2011-04-17"))
        season = Season(name: "Season 1", dateRelease: Date(dateString: "2011-04-17"),
                        episodes: [episode])
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEpisodeExits(){
        XCTAssertNotNil(episode)
    }
    
    func testEpisodeWithoutSeason() {
        XCTAssertNil(episode.season)
    }
    
    func testEpisodeNameValid() {
        season.episodes.forEach { ep in
            XCTAssertEqual(ep.season.name, episode.season.name)
        }
    }
    
    func testEpisodeTitleValid(){
        season.episodes.forEach { ep in
            XCTAssertEqual(ep.title, episode.title)
        }
    }
    
}
