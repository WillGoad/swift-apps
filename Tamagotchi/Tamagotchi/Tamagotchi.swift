//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by Goad, William (PAH) on 22/11/2019.
//  Copyright © 2019 Goad, William (PAH). All rights reserved.
//

import Foundation

class Tamagotchi {
    var name: String
    var colour: String
    var ownerName: String
    var health = 5
    var weight = 100
    var hunger = 5
    var happiness = 3
    var numberOfPoos = 0
    var age = 0
 
    init(name: String, colour: String, ownerName: String) {
        self.name = name
        self.colour = colour
        self.ownerName = ownerName
    }
    
    func feed(foodType: String) {
        if(hunger > 0) {
            hunger += 1
            if(foodType == "snack") {
                weight += 20
                happiness += 1
            } else if(foodType == "meal") {
                hunger = 0
            }
        }
    }
    
    func playGame() {
        if happiness <= 3 {
            happiness += 2
        }
    }

}
