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
    var houses: [House] {
        // Houses creation here
        let starkSigil = Sigil(image: UIImage(named: "codeIsComing.png")!, description: "Lobo Huargo")
        let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "León rampante")
        let targaryenSigil = Sigil(image: UIImage(named: "targaryenSmall.jpg")!, description: "Dragón Tricéfalo")
        
        let starkHouse = House(name: .stark, sigil: starkSigil, words: "Se acerca el invierno", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")! )
        let lannisterHouse = House(name: .lannister, sigil: lannisterSigil, words: "Oye mi rugido", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!)
        let targaryenHouse = House(name: .targaryen, sigil: targaryenSigil, words: "Fuego y Sangre", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!)
        
        let robb = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        
        let tyrion = Person(name: "Tyrion", alias: "El Enano", house: lannisterHouse)
        let cersei = Person(name: "Cersei", house: lannisterHouse)
        let jaime = Person(name: "Jaime", alias: "El Matarreyes", house: lannisterHouse)
        
        let dani = Person(name: "Daenerys", alias: "Madre de Dragones", house: targaryenHouse)
        
        // Add characters to houses
        starkHouse.add(person: arya)
        starkHouse.add(person: robb)
        lannisterHouse.add(person: tyrion)
        lannisterHouse.add(person: cersei)
        lannisterHouse.add(person: jaime)
        targaryenHouse.add(person: dani)
        
        return [starkHouse, lannisterHouse, targaryenHouse].sorted()
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
