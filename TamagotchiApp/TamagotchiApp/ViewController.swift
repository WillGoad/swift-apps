//
//  ViewController.swift
//  TamagotchiApp
//
//  Created by Goad, William (PAH) on 14/01/2020.
//  Copyright © 2020 Goad, William (PAH). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var TamagotchiStatistics: UILabel!
    
    
    
    var tamagotchi = Tamagotchi(name: "Harry", colour: "Red", ownerName: "Will")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TamagotchiStatistics.text = tamagotchi.displayStats()
    }
    
    @IBAction func FeedMealButton(_ sender: Any) {
        tamagotchi.feed("meal")
        updateStats()
    }
    

    @IBAction func FeedSnackButton(_ sender: Any) {
        tamagotchi.feed("snack")
        updateStats()
    }
    
    
    @IBAction func PlayGameButton(_ sender: Any) {
        tamagotchi.playGame()
        updateStats()
    }
    
    func updateStats() {
        TamagotchiStatistics.text = tamagotchi.displayStats()
    }
}

