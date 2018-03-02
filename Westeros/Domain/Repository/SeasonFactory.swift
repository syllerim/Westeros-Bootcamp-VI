//
//  SeasonFactory.swift
//  Westeros
//
//  Created by Mirellys on 02/03/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import Foundation
import UIKit

protocol SeasonFactory {
    typealias FilterSeason = (Season) -> Bool

    var seasons: [Season] { get }
    func season(named: String) -> Season?
    func seasons(filteredBy: FilterSeason) -> [Season]
}

extension LocalFactory: SeasonFactory {
    var seasons: [Season] {
        let episode1 = Episode(title: "Winter Is Coming", broadcastDate: Date(dateString: "2011-04-17"))
        let episode2 = Episode(title: "The Kingsroad", broadcastDate: Date(dateString: "2011-04-24"))
        let episode3 = Episode(title: "Lord Snow", broadcastDate: Date(dateString: "2011-05-01"))
        let episode4 = Episode(title: "Cripples, Bastards, and Broken Things", broadcastDate: Date(dateString: "2011-05-08"))
        let episode5 = Episode(title: "The Wolf and the Lion", broadcastDate: Date(dateString: "2011-05-15"))
        let episode6 = Episode(title: "A Golden Crown", broadcastDate: Date(dateString: "2011-05-22"))
        let episode7 = Episode(title: "You Win or You Die", broadcastDate: Date(dateString: "2011-05-29"))
        let episode8 = Episode(title: "The Pointy End", broadcastDate: Date(dateString: "2011-06-05"))
        let episode9 = Episode(title: "Baelor", broadcastDate: Date(dateString: "2011-06-12"))
        let episode10 = Episode(title: "Fire and Blood", broadcastDate: Date(dateString: "2011-06-19"))
        let episode11 = Episode(title: "The North Remember", broadcastDate: Date(dateString: "2012-04-01"))
        let episode12 = Episode(title: "The Night Lands", broadcastDate: Date(dateString: "2012-04-08"))
        let episode13 = Episode(title: "What Is Dead May Never Die", broadcastDate: Date(dateString: "2012-04-15"))
        let episode14 = Episode(title: "Garden of Bones", broadcastDate: Date(dateString: "2012-04-22"))
        let episode15 = Episode(title: "The Ghost of Harrenhal", broadcastDate: Date(dateString: "2012-04-29"))
        let episode16 = Episode(title: "The Old Gods and the New", broadcastDate: Date(dateString: "2012-05-06"))
        let episode17 = Episode(title: "A Man Without Honor", broadcastDate: Date(dateString: "2012-05-13"))
        let episode18 = Episode(title: "The Prince of Winterfell", broadcastDate: Date(dateString: "2012-05-20"))
        let episode19 = Episode(title: "Blackwater", broadcastDate: Date(dateString: "2012-05-27"))
        let episode20 = Episode(title: "Valar Morghulis", broadcastDate: Date(dateString: "2012-06-03"))
        let episode21 = Episode(title: "Valar Dohaeris", broadcastDate: Date(dateString: "2013-03-31"))
        let episode22 = Episode(title: "Dark Wings, Dark Words", broadcastDate: Date(dateString: "2013-04-07"))
        let episode23 = Episode(title: "Walk of Punishment", broadcastDate: Date(dateString: "2013-04-14"))
        let episode24 = Episode(title: "And Now His Watch Is Ended", broadcastDate: Date(dateString: "2013-04-21"))
        let episode25 = Episode(title: "Kissed by Fire", broadcastDate: Date(dateString: "2013-04-28"))
        let episode26 = Episode(title: "The Climb", broadcastDate: Date(dateString: "2013-05-05"))
        let episode27 = Episode(title: "The Bear and the Maiden Fair", broadcastDate: Date(dateString: "2013-05-12"))
        let episode28 = Episode(title: "Second Sons", broadcastDate: Date(dateString: "2013-05-19"))
        let episode29 = Episode(title: "The Rains of Castamere", broadcastDate: Date(dateString: "2013-06-02"))
        let episode30 = Episode(title: "Mhysa", broadcastDate: Date(dateString: "2013-06-09"))
        let episode31 = Episode(title: "Two Swords", broadcastDate: Date(dateString: "2014-04-06"))
        let episode32 = Episode(title: "The Lion and the Rose", broadcastDate: Date(dateString: "2014-04-13"))
        let episode33 = Episode(title: "Breaker of Chains", broadcastDate: Date(dateString: "2014-04-20"))
        let episode34 = Episode(title: "Oathkeeper", broadcastDate: Date(dateString: "2014-04-27"))
        let episode35 = Episode(title: "First of His Name", broadcastDate: Date(dateString: "2014-05-04"))
        let episode36 = Episode(title: "The Laws of Gods and Men", broadcastDate: Date(dateString: "2014-05-11"))
        let episode37 = Episode(title: "Mockingbird", broadcastDate: Date(dateString: "2014-05-18"))
        let episode38 = Episode(title: "The Mountain and the Viper", broadcastDate: Date(dateString: "2014-06-01"))
        let episode39 = Episode(title: "The Watchers on the Wall", broadcastDate: Date(dateString: "2014-06-08"))
        let episode40 = Episode(title: "The Children", broadcastDate: Date(dateString: "2014-06-15"))
        let episode41 = Episode(title: "The Wars to Come", broadcastDate: Date(dateString: "2015-04-12"))
        let episode42 = Episode(title: "The House of Black and White", broadcastDate: Date(dateString: "2015-04-19"))
        let episode43 = Episode(title: "High Sparrow", broadcastDate: Date(dateString: "2015-04-26"))
        let episode44 = Episode(title: "Sons of the Harpy", broadcastDate: Date(dateString: "2015-05-03"))
        let episode45 = Episode(title: "Kill the Boy", broadcastDate: Date(dateString: "2015-05-10"))
        let episode46 = Episode(title: "Unbowed, Unbent, Unbroken", broadcastDate: Date(dateString: "2015-05-17"))
        let episode47 = Episode(title: "The Gift", broadcastDate: Date(dateString: "2015-05-24"))
        let episode48 = Episode(title: "Hardhome", broadcastDate: Date(dateString: "2015-05-31"))
        let episode49 = Episode(title: "The Dance of Dragons", broadcastDate: Date(dateString: "2015-06-07"))
        let episode50 = Episode(title: "Mother's Mercy", broadcastDate: Date(dateString: "2015-06-14"))
        let episode51 = Episode(title: "The Red Woman", broadcastDate: Date(dateString: "2016-04-24"))
        let episode52 = Episode(title: "Home", broadcastDate: Date(dateString: "2016-05-01"))
        let episode53 = Episode(title: "Oathbreaker", broadcastDate: Date(dateString: "2016-05-08"))
        let episode54 = Episode(title: "Book of the Stranger", broadcastDate: Date(dateString: "2016-05-15"))
        let episode55 = Episode(title: "The Door", broadcastDate: Date(dateString: "2016-05-22"))
        let episode56 = Episode(title: "Blood of My Blood", broadcastDate: Date(dateString: "2016-05-29"))
        let episode57 = Episode(title: "The Broken Man", broadcastDate: Date(dateString: "2016-06-05"))
        let episode58 = Episode(title: "No One", broadcastDate: Date(dateString: "2016-06-12"))
        let episode59 = Episode(title: "Battle of the Bastards", broadcastDate: Date(dateString: "2016-06-19"))
        let episode60 = Episode(title: "The Winds of Winter", broadcastDate: Date(dateString: "2016-06-26"))
        let episode61 = Episode(title: "Dragonstone", broadcastDate: Date(dateString: "2017-07-16"))
        let episode62 = Episode(title: "Stormborn", broadcastDate: Date(dateString: "2017-07-23"))
        let episode63 = Episode(title: "The Queen's Justice", broadcastDate: Date(dateString: "2017-07-30"))
        let episode64 = Episode(title: "The Spoils of War", broadcastDate: Date(dateString: "2017-08-06"))
        let episode65 = Episode(title: "Eastwatch", broadcastDate: Date(dateString: "2017-08-13"))
        let episode66 = Episode(title: "Beyond the Wall", broadcastDate: Date(dateString: "2017-08-20"))
        let episode67 = Episode(title: "The Dragon and the Wolf", broadcastDate: Date(dateString: "2017-08-20"))
        
        //Group episodes by Seasons
        let episodesS01:Set<Episode> = [episode1, episode2, episode3, episode4, episode5, episode6, episode7, episode8, episode9, episode10]
        let episodesS02:Set<Episode> = [episode11, episode12, episode13, episode14, episode15, episode16, episode17, episode18, episode19, episode20]
        let episodesS03:Set<Episode> = [episode21, episode22, episode23, episode24, episode25, episode26, episode27, episode28, episode29, episode30]
        let episodesS04:Set<Episode> = [episode31, episode32, episode33, episode34, episode35, episode36, episode37, episode38, episode39, episode40]
        let episodesS05:Set<Episode> = [episode41, episode42, episode43, episode44, episode45, episode46, episode47, episode48, episode49, episode50]
        let episodesS06:Set<Episode> = [episode51, episode52, episode53, episode54, episode55, episode56, episode57, episode58, episode59, episode60]
        let episodesS07:Set<Episode> = [episode61, episode62, episode63, episode64, episode65, episode66, episode67]

        //Create Seasons
        let season1: Season! = Season(name: "Season 1", dateRelease: Date(dateString: "2011-04-17"), episodes: episodesS01)
        let season2: Season! = Season(name: "Season 2", dateRelease: Date(dateString: "2012-04-01"), episodes: episodesS02)
        let season3: Season! = Season(name: "Season 3", dateRelease: Date(dateString: "2013-03-31"), episodes: episodesS03)
        let season4: Season! = Season(name: "Season 4", dateRelease: Date(dateString: "2014-04-06"), episodes: episodesS04)
        let season5: Season! = Season(name: "Season 5", dateRelease: Date(dateString: "2015-04-12"), episodes: episodesS05)
        let season6: Season! = Season(name: "Season 6", dateRelease: Date(dateString: "2016-04-24"), episodes: episodesS06)
        let season7: Season! = Season(name: "Season 7", dateRelease: Date(dateString: "2017-07-16"), episodes: episodesS07)
        
        return [season1, season2, season3, season4, season5, season6, season7].sorted()
    }
    
    func season(named name: String) -> Season? {
        return seasons.filter{ $0.name.uppercased() == name.uppercased() }.first
    }
    
    func seasons(filteredBy: FilterSeason) -> [Season] {
        return seasons.filter(filteredBy)
    }
}
