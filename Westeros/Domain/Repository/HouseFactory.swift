//
//  HouseFactory.swift
//  Westeros
//
//  Created by Alexandre Freire on 13/02/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import Foundation
import UIKit

protocol HouseFactory {
    typealias FilterHouse = (House) -> Bool
    
    var houses: [House] { get }
    func house(named: String) -> House?
    func houses(filteredBy: FilterHouse) -> [House]
    func house(name: HouseName) -> House?
}

extension LocalFactory: HouseFactory {
    
    var localDataHouses: [House] {
        
        // Houses creation here in memory
        let starkSigil = Sigil(image: "codeIsComing.png", description: "Lobo Huargo")
        let lannisterSigil = Sigil(image: "lannister.jpg", description: "León rampante")
        let targaryenSigil = Sigil(image: "targaryenSmall.jpg", description: "Dragón Tricéfalo")
        
        let starkHouse = House(name: .stark, sigil: starkSigil, words: "Se acerca el invierno", url: "https://awoiaf.westeros.org/index.php/House_Stark")
        let lannisterHouse = House(name: .lannister, sigil: lannisterSigil, words: "Oye mi rugido", url: "https://awoiaf.westeros.org/index.php/House_Lannister")
        let targaryenHouse = House(name: .targaryen, sigil: targaryenSigil, words: "Fuego y Sangre", url: "https://awoiaf.westeros.org/index.php/House_Targaryen")
        
        let _ = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse)
        let _ = Person(name: "Arya", house: starkHouse)
        
        let _ = Person(name: "Tyrion", alias: "El Enano", house: lannisterHouse)
        let _ = Person(name: "Cersei", house: lannisterHouse)
        let _ = Person(name: "Jaime", alias: "El Matarreyes", house: lannisterHouse)
        
        let _ = Person(name: "Daenerys", alias: "Madre de Dragones", house: targaryenHouse)
        
        return [starkHouse, lannisterHouse, targaryenHouse].sorted()
    }

    var houses: [House] {
        var houses = [House]()
        if let fileURL = Bundle.main.url(forResource:"characters", withExtension: "json") {
            do {
                let dataJSON = try Data.init(contentsOf: fileURL)
                let persons = try JSONDecoder().decode([Person].self, from: dataJSON)
                
                let housesName = Set(persons.flatMap{ ($0.house.name) })
                
                housesName.forEach({ houseName in
                    let p = persons.filter({ $0.house.name == houseName })
                    if let h = p.first?.house {
                        let house = House(name: h.name, sigil: h.sigil, words: h.words, url: h.wikiURL)
                        p.forEach({ person in
                            house.add(person: person)
                        })
                        houses.append(house)
                    }
                })
                
            } catch {
                print(error)
            }
        }
        return houses.sorted()
        
    }
    
    func house(named name: String) -> House? {
        let house = houses.filter{ $0.name.rawValue.uppercased() == name.uppercased() }.first
        return house
    }
    
    func houses(filteredBy: FilterHouse) -> [House] {
        return Repository.local.houses.filter(filteredBy)
    }
    
    func house(name: HouseName) -> House? {
        return houses.filter{ $0.name.rawValue == name.rawValue }.first
    }
    
    

}
