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
    var timeRemaining = 30
    var timePoo = 8
    var timer: Timer?
    
    
    @IBOutlet var feedMeal: UIButton!
    @IBOutlet var feedSnack: UIButton!
    @IBOutlet var playGame: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TamagotchiStatistics.text = tamagotchi.displayStats()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    }
    
    @objc func countDown() {
        //Age
        if timeRemaining > 0 {
            timeRemaining -= 1
        } else {
            timeRemaining = tamagotchi.secondsPerYear
            increaseAge()
        }
        
        //Poo
        if timePoo > 0 {
            timePoo -= 1
        } else {
            timePoo = Int.random(in: 5...15)
            tamagotchiPoo()
        }
    }
    
    @IBAction func feedMealButton(_ sender: Any) {
        tamagotchi.feed("meal")
        updateStats()
    }
    
    @IBAction func feedSnackButton(_ sender: Any) {
        tamagotchi.feed("snack")
        updateStats()
    }
    
    @IBAction func playGameButton(_ sender: Any) {
        tamagotchi.playGame()
        updateStats()
    }
    
    func updateStats() {
        TamagotchiStatistics.text = tamagotchi.displayStats()
    }
    
    func increaseAge() {
        if tamagotchi.age < tamagotchi.maxAge {
            tamagotchi.incrAge()
            updateStats()
        } else {
            tamagotchiDie(of: "Old Age")
        }
    }
    
    func tamagotchiPoo() {
        tamagotchi.numberOfPoos += 1
        if tamagotchi.numberOfPoos >= 2 {
            //Deciding how to make kt wokr
        }
        
        
    }
    
    func tamagotchiDie(of Cause: String) {
        TamagotchiStatistics.text = """
        Your Tamagotchi has now Died.
        Cause:
        """ + Cause + """

        Your final Stats:

        """ + tamagotchi.displayStats()
        disableAllButtons()
    }
    
    func disableAllButtons() {
        feedMeal.isEnabled = false
        feedSnack.isEnabled = false
        playGame.isEnabled = false
    }
}

