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
        let episode1 = Episode(title: "Winter Is Coming", broadcastDate: Date(dateString: "2011-04-17"), summary: "Lord Stark is troubled by reports from a Night's Watch deserter; King Robert and the Lannisters arrive at Winterfell; Viserys Targaryen forges a new alliance.")
        let episode2 = Episode(title: "The Kingsroad", broadcastDate: Date(dateString: "2011-04-24"), summary: "The Lannisters plot to ensure Bran's silence; Jon and Tyrion head to the Wall; Ned faces a family crisis en route to King's Landing.")
        let episode3 = Episode(title: "Lord Snow", broadcastDate: Date(dateString: "2011-05-01"), summary: "Jon impresses Tyrion at Castle Black; Ned confronts his past and future at King's Landing; Daenerys finds herself at odds with Viserys.")
        let episode4 = Episode(title: "Cripples, Bastards, and Broken Things", broadcastDate: Date(dateString: "2011-05-08"), summary: "Ned probes Arryn's death; Jon takes measures to protect Sam; Tyrion is caught in the wrong place.")
        let episode5 = Episode(title: "The Wolf and the Lion", broadcastDate: Date(dateString: "2011-05-15"), summary: "Ned refuses an order from the King; Tyrion escapes one perilous encounter, only to find himself in another.")
        let episode6 = Episode(title: "A Golden Crown", broadcastDate: Date(dateString: "2011-05-22"), summary: "Ned makes a controversial decree; Tyrion confesses to his 'crimes'; Viserys receives final payment for Daenerys.")
        let episode7 = Episode(title: "You Win or You Die", broadcastDate: Date(dateString: "2011-05-29"), summary: "Ned confronts Cersei about her secrets; Jon takes his Night's Watch vows; Drogo promises to lead the Dothraki to King's Landing.")
        let episode8 = Episode(title: "The Pointy End", broadcastDate: Date(dateString: "2011-06-05"), summary: "The Lannisters press their advantage over the Starks; Robb rallies his father's northern allies and heads south to war.")
        let episode9 = Episode(title: "Baelor", broadcastDate: Date(dateString: "2011-06-12"), summary: "Ned makes a fateful decision; Robb takes a prized prisoner; Dany finds her reign imperiled.")
        let episode10 = Episode(title: "Fire and Blood", broadcastDate: Date(dateString: "2011-06-19"), summary: "A new king rises in the North; a Khaleesi finds new hope.")
        let episode11 = Episode(title: "The North Remember", broadcastDate: Date(dateString: "2012-04-01"), summary: "Tyrion arrives to save Joffrey's crown; Daenerys searches for allies and water in the Red Waste; Jon Snow faces the wilderness beyond the Wall.")
        let episode12 = Episode(title: "The Night Lands", broadcastDate: Date(dateString: "2012-04-08"), summary: "Arya shares a secret; a scout returns to Dany with disturbing news; Theon comes home to the Iron Islands; Tyrion administers justice; Jon witnesses a terrible crime.")
        let episode13 = Episode(title: "What Is Dead May Never Die", broadcastDate: Date(dateString: "2012-04-15"), summary: "Tyrion roots out a spy; Catelyn meets a new king and queen; Bran dreams; Theon drowns.")
        let episode14 = Episode(title: "Garden of Bones", broadcastDate: Date(dateString: "2012-04-22"), summary: "Catelyn tries to save two kings from themselves; Tyrion practices coercion; Robb meets a foreigner; Dany finds her ally; Melisandre casts a shadow on the Stormlands.")
        let episode15 = Episode(title: "The Ghost of Harrenhal", broadcastDate: Date(dateString: "2012-04-29"), summary: "The Baratheon rivalry ends; Tyrion learns of Cersei's secret weapon; Dany suffers a loss; Arya collects a debt she didn't know was owed; Jon Snow meets a legend.")
        let episode16 = Episode(title: "The Old Gods and the New", broadcastDate: Date(dateString: "2012-05-06"), summary: "The Baratheon rivalry ends; Tyrion learns of Cersei's secret weapon; Dany suffers a loss; Arya collects a debt she didn't know was owed; Jon Snow meets a legend.")
        let episode17 = Episode(title: "A Man Without Honor", broadcastDate: Date(dateString: "2012-05-13"), summary: "Jaime meets a relative; Theon hunts; Dany receives an invitation.")
        let episode18 = Episode(title: "The Prince of Winterfell", broadcastDate: Date(dateString: "2012-05-20"), summary: "Theon holds down the fort; Arya calls in her debt with Jaqen; Robb is betrayed; Stannis and Davos approach their destination.")
        let episode19 = Episode(title: "Blackwater", broadcastDate: Date(dateString: "2012-05-27"), summary: "Tyrion and the Lannisters fight for their lives as Stannis' fleet assaults King's Landing.")
        let episode20 = Episode(title: "Valar Morghulis", broadcastDate: Date(dateString: "2012-06-03"), summary: "Arya receives a gift from Jaqen; Dany goes to a strange place; Jon proves himself.")
        let episode21 = Episode(title: "Valar Dohaeris", broadcastDate: Date(dateString: "2013-03-31"), summary: "Jon is tested by the wildling king; Tyrion asks for his reward; Daenerys sails into Slaver's Bay.")
        let episode22 = Episode(title: "Dark Wings, Dark Words", broadcastDate: Date(dateString: "2013-04-07"), summary: "Arya runs into the Brotherhood Without Banners; Jaime finds a way to pass the time.")
        let episode23 = Episode(title: "Walk of Punishment", broadcastDate: Date(dateString: "2013-04-14"), summary: "Dany hears the price; Jaime strikes a deal with his captors.")
        let episode24 = Episode(title: "And Now His Watch Is Ended", broadcastDate: Date(dateString: "2013-04-21"), summary: "The Night's Watch takes stock; Dany exchanges a chain for a whip.")
        let episode25 = Episode(title: "Kissed by Fire", broadcastDate: Date(dateString: "2013-04-28"), summary: "The Hound is judged; Jon proves himself; Robb is betrayed.")
        let episode26 = Episode(title: "The Climb", broadcastDate: Date(dateString: "2013-05-05"), summary: "Four Houses consider make-or-break alliances; Jon and the wildlings face a daunting climb.")
        let episode27 = Episode(title: "The Bear and the Maiden Fair", broadcastDate: Date(dateString: "2013-05-12"), summary: "Dany exchanges gifts in Yunkai; Brienne faces a formidable foe in Harrenhal.")
        let episode28 = Episode(title: "Second Sons", broadcastDate: Date(dateString: "2013-05-19"), summary: "Dany meets the Titan's Bastard; King's Landing hosts a royal wedding.")
        let episode29 = Episode(title: "The Rains of Castamere", broadcastDate: Date(dateString: "2013-06-02"), summary: "House Frey joins forces with House Tully; Jon faces his most difficult test yet.")
        let episode30 = Episode(title: "Mhysa", broadcastDate: Date(dateString: "2013-06-09"), summary: "Joffrey challenges Tywin; Dany waits to see if she is a conqueror or a liberator.")
        let episode31 = Episode(title: "Two Swords", broadcastDate: Date(dateString: "2014-04-06"), summary: "King's Landing prepares for a royal wedding; Dany finds the way to Meereen; the Night's Watch braces for a new threat.")
        let episode32 = Episode(title: "The Lion and the Rose", broadcastDate: Date(dateString: "2014-04-13"), summary: "The Lannisters and their guests gather in King's Landing.")
        let episode33 = Episode(title: "Breaker of Chains", broadcastDate: Date(dateString: "2014-04-20"), summary: "Tyrion ponders his options; Tywin extends an olive branch; Jon proposes a bold plan.")
        let episode34 = Episode(title: "Oathkeeper", broadcastDate: Date(dateString: "2014-04-27"), summary: "Dany balances justice and mercy; Jaime turns to Brienne; Jon readies his men.")
        let episode35 = Episode(title: "First of His Name", broadcastDate: Date(dateString: "2014-05-04"), summary: "Cersei and Tywin plot the Crown's next move; Jon embarks on a new mission.")
        let episode36 = Episode(title: "The Laws of Gods and Men", broadcastDate: Date(dateString: "2014-05-11"), summary: "Tyrion faces down his father in the Throne Room.")
        let episode37 = Episode(title: "Mockingbird", broadcastDate: Date(dateString: "2014-05-18"), summary: "Tyrion enlists an unlikely ally.")
        let episode38 = Episode(title: "The Mountain and the Viper", broadcastDate: Date(dateString: "2014-06-01"), summary: "Mole's Town receives unexpected visitors; Tyrion's fate is decided.")
        let episode39 = Episode(title: "The Watchers on the Wall", broadcastDate: Date(dateString: "2014-06-08"), summary: "The Night's Watch face their biggest challenge.")
        let episode40 = Episode(title: "The Children", broadcastDate: Date(dateString: "2014-06-15"), summary: "Dany faces some harsh realities; Tyrion sees the truth of his situation.")
        let episode41 = Episode(title: "The Wars to Come", broadcastDate: Date(dateString: "2015-04-12"), summary: "Tyrion learns of a conspiracy; Jon is caught between two kings.")
        let episode42 = Episode(title: "The House of Black and White", broadcastDate: Date(dateString: "2015-04-19"), summary: "Arya arrives in Braavos; Stannis tempts Jon.")
        let episode43 = Episode(title: "High Sparrow", broadcastDate: Date(dateString: "2015-04-26"), summary: "Cersei does justice; Tyrion walks the Long Bridge of Volantis.")
        let episode44 = Episode(title: "Sons of the Harpy", broadcastDate: Date(dateString: "2015-05-03"), summary: "The Faith Militant grow increasingly aggressive; Jaime and Bronn head south; Ellaria and the Sand Snakes vow vengeance.")
        let episode45 = Episode(title: "Kill the Boy", broadcastDate: Date(dateString: "2015-05-10"), summary: "Dany makes a difficult decision in Meereen; Jon recruits the help of an unexpected ally; Brienne searches for Sansa; Theon remains under Ramsay's control.")
        let episode46 = Episode(title: "Unbowed, Unbent, Unbroken", broadcastDate: Date(dateString: "2015-05-17"), summary: "Arya trains; Jorah and Tyrion run into slavers; Trystane and Myrcella make plans; Jaime and Bronn reach their destination; The Sand Snakes attack.")
        let episode47 = Episode(title: "The Gift", broadcastDate: Date(dateString: "2015-05-24"), summary: "Jon prepares for conflict; Sansa tries to talk to Theon; Brienne waits for a sign; Stannis remains stubborn; Jaime attempts to reconnect with family")
        let episode48 = Episode(title: "Hardhome", broadcastDate: Date(dateString: "2015-05-31"), summary: "Arya makes progress in her training; Sansa confronts an old friend; Cersei struggles; Jon travels.")
        let episode49 = Episode(title: "The Dance of Dragons", broadcastDate: Date(dateString: "2015-06-07"), summary: "Stannis confronts a troubling decision; Arya encounters someone from her past; Dany reluctantly observes a custom.")
        let episode50 = Episode(title: "Mother's Mercy", broadcastDate: Date(dateString: "2015-06-14"), summary: "Stannis marches; Dany is surrounded by strangers; Cersei seeks forgiveness; Jon is challenged.")
        let episode51 = Episode(title: "The Red Woman", broadcastDate: Date(dateString: "2016-04-24"), summary: "Jon Snow is dead; Daenerys meets a strong man; Cersei sees her daughter again.")
        let episode52 = Episode(title: "Home", broadcastDate: Date(dateString: "2016-05-01"), summary: "Bran goes home; The Night's Watch stands behind Thorne.")
        let episode53 = Episode(title: "Oathbreaker", broadcastDate: Date(dateString: "2016-05-08"), summary: "Daenerys meets her future; Arya trains to be No One.")
        let episode54 = Episode(title: "Book of the Stranger", broadcastDate: Date(dateString: "2016-05-15"), summary: "Tyrion strikes a deal; Jorah and Daario undertake a difficult task.")
        let episode55 = Episode(title: "The Door", broadcastDate: Date(dateString: "2016-05-22"), summary: "Tyrion seeks a strange ally; Bran learns a great deal.")
        let episode56 = Episode(title: "Blood of My Blood", broadcastDate: Date(dateString: "2016-05-29"), summary: "Jaime challenges the High Sparrow; Arya faces a difficult choice.")
        let episode57 = Episode(title: "The Broken Man", broadcastDate: Date(dateString: "2016-06-05"), summary: "The High Sparrow eyes another target; The North is reminded.")
        let episode58 = Episode(title: "No One", broadcastDate: Date(dateString: "2016-06-12"), summary: "Jaime weighs his options; Tyrion's plans bear fruit.")
        let episode59 = Episode(title: "Battle of the Bastards", broadcastDate: Date(dateString: "2016-06-19"), summary: "Terms of surrender are rejected and accepted.")
        let episode60 = Episode(title: "The Winds of Winter", broadcastDate: Date(dateString: "2016-06-26"), summary: "Cersei faces a day of reckoning.")
        let episode61 = Episode(title: "Dragonstone", broadcastDate: Date(dateString: "2017-07-16"), summary: "Jon organizes the defense of the North. Cersei tries to even the odds. Daenerys comes home.")
        let episode62 = Episode(title: "Stormborn", broadcastDate: Date(dateString: "2017-07-23"), summary: "Daenerys receives an unexpected visitor; Jon faces a revolt.")
        let episode63 = Episode(title: "The Queen's Justice", broadcastDate: Date(dateString: "2017-07-30"), summary: "Daenerys holds court; Cersei returns a gift.")
        let episode64 = Episode(title: "The Spoils of War", broadcastDate: Date(dateString: "2017-08-06"), summary: "The Lannisters pay their debts. Daenerys weighs her options.")
        let episode65 = Episode(title: "Eastwatch", broadcastDate: Date(dateString: "2017-08-13"), summary: "Arya grows suspicious. Tyrion answers a good question.")
        let episode66 = Episode(title: "Beyond the Wall", broadcastDate: Date(dateString: "2017-08-20"), summary: "Jon hunts the dead. Arya confronts Sansa.")
        let episode67 = Episode(title: "The Dragon and the Wolf", broadcastDate: Date(dateString: "2017-08-20"), summary: "Tyrion tries to save Westeros from itself.")
        
        //Group episodes by Seasons
        let episodesS01:Set<Episode> = [episode1, episode2, episode3, episode4, episode5, episode6, episode7, episode8, episode9, episode10]
        let episodesS02:Set<Episode> = [episode11, episode12, episode13, episode14, episode15, episode16, episode17, episode18, episode19, episode20]
        let episodesS03:Set<Episode> = [episode21, episode22, episode23, episode24, episode25, episode26, episode27, episode28, episode29, episode30]
        let episodesS04:Set<Episode> = [episode31, episode32, episode33, episode34, episode35, episode36, episode37, episode38, episode39, episode40]
        let episodesS05:Set<Episode> = [episode41, episode42, episode43, episode44, episode45, episode46, episode47, episode48, episode49, episode50]
        let episodesS06:Set<Episode> = [episode51, episode52, episode53, episode54, episode55, episode56, episode57, episode58, episode59, episode60]
        let episodesS07:Set<Episode> = [episode61, episode62, episode63, episode64, episode65, episode66, episode67]

        //let summaries
        let summarySeason1 = "The story takes place in a fictional world, primarily upon a continent called Westeros, with one storyline occurring on another continent to the east known as Essos. Like the novel, the season initially focuses on the family of nobleman Eddard Stark, who is asked to become chief advisor to his king and longtime friend, Robert Baratheon. Ned must find out who killed the previous Hand of the King, Jon Arryn, while trying to protect his family from their rivals the Lannisters. He uncovers the dark secrets about the Lannisters that his predecessor died trying to expose. Meanwhile, in Essos, the exiled Viserys Targaryen, son of the former king, believes he still has the rightful claim to the throne."
        
        let summarySeason2 = "The story takes place in a fictional world, primarily upon a continent called Westeros, with one storyline occurring on another continent to the east known as Essos. Like the novel, the season follows the dramatic death of Lord Eddard 'Ned' Stark, with all of the Starks being separated across Westeros. Season two mainly centres around the War of the Five Kings, fought between the leaders of Westerosi factions who are either staking a claim on the Iron Throne, or seeking independence from it."
        
        let summarySeason3 = "The story takes place in a fictional world, primarily upon a continent called Westeros, with one storyline occurring on another continent to the east known as Essos. Like the novel, the season follows the climactic battle at Kings Landing. Season three like the previous season mainly centers around the war of the five kings; after the death of Renly Baratheon, all four kings in Westeros believes to have a claim to the Iron Throne, besides Robb Stark, who seeks vengeance for the death of his father, Lord Eddard 'Ned' Stark."
        
        let summarySeason4 = "The story takes place in a fictional world, primarily upon a continent called Westeros, with one storyline occurring on another continent to the east known as Essos. Like the novel, the season like the previous seasons mainly centres around the war of the five kings; after the death of Robb Stark at The Red Wedding, all three remaining kings in Westeros believe to have a claim to the Iron Throne. Meanwhile, at the wall, Jon Snow and the Night's Watch get ready for the battle against the free folk."
        
        let summarySeason5 = "The season primarily adapts material from A Feast for Crows and A Dance with Dragons, the fourth and fifth novels in George R. R. Martin's A Song of Ice and Fire series, though it also uses elements from the third novel, A Storm of Swords, as well as the upcoming sixth novel The Winds of Winter.  It also contains original content not found in Martin's novels. The series is adapted for television by David Benioff and D. B. Weiss."
        
        let summarySeason6 = "The season follows the continuing struggle between the Starks and other noble families of Westeros for the Iron Throne. The Starks defeat the Bolton forces in battle, and Jon Snow is proclaimed the King in the North. Tyrion attempts to rule Meereen while Daenerys is held captive by a Dothraki tribe. At King's Landing, the Tyrell army attempts to liberate Margaery and Loras, but Margaery capitulates to the High Sparrow, who becomes more powerful by influencing King Tommen. At her trial, Cersei burns the Great Sept, killing her rivals, while Tommen kills himself. Cersei is crowned Queen of the Seven Kingdoms. Ellaria Sand and three of Oberyn Martell's daughters kill Doran and Trystane Martell and seize control of Dorne. In Essos, Daenerys Targaryen is captured by Khal Moro who takes her before the khals; she burns them alive and takes command of the Dothraki. Olenna and the Dornish ally with Daenerys."
        
        let summarySeason7 = "The penultimate season focuses primarily on the convergence of the show's main plotlines, featuring major events such as Daenerys Targaryen arriving in Westeros with her army and three dragons and waging war against the Lannisters, Jon Snow forging an alliance with Daenerys in an attempt to unite their forces against the White Walker army, Arya and Bran returning to Winterfell and reuniting with their sister Sansa, and the army of the dead breaching the Wall (with the help of a reanimated wight dragon) and entering the Seven Kingdoms."
        
        //Create Seasons
        let season1: Season! = Season(name: "Season 1", dateRelease: Date(dateString: "2011-04-17"), summary: summarySeason1, image: #imageLiteral(resourceName: "got-season1.jpg"), episodes: episodesS01)
        let season2: Season! = Season(name: "Season 2", dateRelease: Date(dateString: "2012-04-01"), summary: summarySeason2, image: #imageLiteral(resourceName: "got-season2.jpg"), episodes: episodesS02)
        let season3: Season! = Season(name: "Season 3", dateRelease: Date(dateString: "2013-03-31"), summary: summarySeason3, image: #imageLiteral(resourceName: "got-season3.jpg"), episodes: episodesS03)
        let season4: Season! = Season(name: "Season 4", dateRelease: Date(dateString: "2014-04-06"), summary: summarySeason4, image: #imageLiteral(resourceName: "got-season4.jpg"), episodes: episodesS04)
        let season5: Season! = Season(name: "Season 5", dateRelease: Date(dateString: "2015-04-12"), summary: summarySeason5, image: #imageLiteral(resourceName: "got-season5.png"), episodes: episodesS05)
        let season6: Season! = Season(name: "Season 6", dateRelease: Date(dateString: "2016-04-24"), summary: summarySeason6, image: #imageLiteral(resourceName: "got-season6.jpeg"), episodes: episodesS06)
        let season7: Season! = Season(name: "Season 7", dateRelease: Date(dateString: "2017-07-16"), summary: summarySeason7, image: #imageLiteral(resourceName: "got-season7.png"), episodes: episodesS07)
        
        return [season1, season2, season3, season4, season5, season6, season7].sorted()
    }
    
    func season(named name: String) -> Season? {
        return seasons.filter{ $0.name.uppercased() == name.uppercased() }.first
    }
    
    func seasons(filteredBy: FilterSeason) -> [Season] {
        return seasons.filter(filteredBy)
    }
}
