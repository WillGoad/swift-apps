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
    var timeRemaining = 5
    var timePoo = 8
    var timer: Timer?
    
    
    @IBOutlet var feedMeal: UIButton!
    @IBOutlet var feedSnack: UIButton!
    @IBOutlet var playGame: UIButton!
    @IBOutlet var cleanUp: UIButton!
    @IBOutlet var feedMedicine: UIButton!
    
    
    
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
    
    @IBAction func cleanUpButton(_ sender: Any) {
        if tamagotchi.numberOfPoos > 0 {
            tamagotchi.numberOfPoos -= 1
        }
        
    }
    
    @IBAction func feedMedicineButton(_ sender: Any) {
        if tamagotchi.health <= 5 {
            tamagotchi.health += 1
        }
        
    }
    
    
    
    
    func updateStats() {
        TamagotchiStatistics.text = tamagotchi.displayStats()
    }
    
    func increaseAge() {
        if tamagotchi.age < tamagotchi.maxAge {
            tamagotchi.incrAge()
            updateStats()
            if tamagotchi.isIll == true {
                tamagotchi.health -= 1
                if tamagotchi.health <= 0 {
                    tamagotchiDie(of: "Ran out of health")
                }
                tamagotchi.weight -= 40
                if tamagotchi.weight <= 0 {
                    tamagotchiDie(of: "Wasted Away")
                }
                tamagotchi.happiness -= 1
                if tamagotchi.hunger >= 0 {
                    tamagotchi.hunger -= 1
                }
            } else {
                tamagotchi.weight -= 20
                if tamagotchi.weight <= 0 {
                    tamagotchiDie(of: "Wasted Away")
                }
                tamagotchi.happiness += 1
                tamagotchi.hunger += 1
            }
            if tamagotchi.health >= 10 {
                
            }
        } else {
            tamagotchiDie(of: "Old Age")
            timer?.invalidate()
        }
    }
    
    func tamagotchiPoo() {
        tamagotchi.numberOfPoos += 1
        if tamagotchi.numberOfPoos >= 12 {
            tamagotchi.isIll = true
            if tamagotchi.happiness - 5 >= 0 {
                tamagotchi.happiness -= 5
            }

            updateStats()
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
        feedMedicine.isEnabled = false
        cleanUp.isEnabled = false
    }
}

