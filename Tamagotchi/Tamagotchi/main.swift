//
//  main.swift
//  Tamagotchi
//
//  Created by Goad, William (PAH) on 19/11/2019.
//  Copyright © 2019 Goad, William (PAH). All rights reserved.
//

import Foundation

class tamaGotchi {
  var name: String?
  var colour: String?
  var ownerName: String?
  var health = 100
  var weight = 100
  var numberOfPoos = 0
  var age = 0
}

let myTamagotchi = tamaGotchi()

myTamagotchi.name = "bob"

print(myTamagotchi.name)

