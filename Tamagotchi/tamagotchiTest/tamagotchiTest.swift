//
//  tamagotchiTest.swift
//  tamagotchiTest
//
//  Created by Goad, William (PAH) on 19/11/2019.
//  Copyright © 2019 Goad, William (PAH). All rights reserved.
//

import XCTest

class TamagotchiTest: XCTestCase {

    
    
    func testTamagotchiInitialiserSetsAllDefaultValues() {
        //arrange
        //act
        let tamagotchi = Tamagotchi(name: "Bob", colour: "Red", ownerName: "Will")
        //assert
        XCTAssertEqual(tamagotchi.age, 0)
        XCTAssertEqual(tamagotchi.weight, 100)
        XCTAssertEqual(tamagotchi.health, 5)
        XCTAssertEqual(tamagotchi.hunger, 5)
        XCTAssertEqual(tamagotchi.happiness, 3)
        XCTAssertEqual(tamagotchi.numberOfPoos, 0)
        
    }
    
    func testFeedSnackIncreasesWeightBy20AndHappinessBy1() {
        //arrange
        let tamagotchi = Tamagotchi(name: "Bob", colour: "Red", ownerName: "Will")
        let initialWeight = tamagotchi.weight
        let initialHappiness = tamagotchi.happiness
        
        //act
        tamagotchi.feed(foodType: "snack")
        //assert
        XCTAssertEqual(tamagotchi.weight, initialWeight + 20)
        XCTAssertEqual(tamagotchi.happiness, initialHappiness + 1)
    }
    
    func testFeedMealMakesHunger0() {
        //arrange
        let tamagotchi = Tamagotchi(name: "Bob", colour: "Red", ownerName: "Will")
        

        
        //act
        tamagotchi.feed(foodType: "meal")
        //assert
        XCTAssertEqual(tamagotchi.hunger, 0)
    }
    
    func testPlayGameIncreasesHappinessBy2IfHappinessLessThanOrEqualTo3() {
        //arrange
        let tamagotchi = Tamagotchi(name: "Bob", colour: "Red", ownerName: "Will")
        let initialHappiness = tamagotchi.happiness
        
        //act
        tamagotchi.playGame()
        //assert
        if initialHappiness <= 3 {
            XCTAssertEqual(tamagotchi.happiness, initialHappiness + 2)
        } else {
            XCTAssertEqual(tamagotchi.happiness, initialHappiness)
        }
        
    }
}
