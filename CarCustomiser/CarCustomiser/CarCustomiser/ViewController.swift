//
//  ViewController.swift
//  CarCustomiser
//
//  Created by Goad, William (PAH) on 11/01/2020.
//  Copyright © 2020 Goad, William (PAH). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var engineAndExhaustPackage: UISwitch!
    @IBOutlet var tyresPackage: UISwitch!
    @IBOutlet var electricPackage: UISwitch!
    @IBOutlet var washPackage: UISwitch!
    
    @IBOutlet weak var CarStatistics: UILabel!

    @IBOutlet var remainingFundsDisplay: UILabel!
    
    var remainingFunds = 0 {
        didSet {
            remainingFundsDisplay.text = "Remaining Funds: \(remainingFunds)"
            if remainingFunds < 500 {
                if !tyresPackage.isOn {
                    tyresPackage.isEnabled = false
                }
                if !engineAndExhaustPackage.isOn {
                    engineAndExhaustPackage.isEnabled = false
                }
            } else {
                tyresPackage.isEnabled = true
                engineAndExhaustPackage.isEnabled = true
            }
            if remainingFunds < 200 {
                if !electricPackage.isOn {
                    electricPackage.isEnabled = false
                }
                if !washPackage.isOn {
                    washPackage.isEnabled = false
                }
            } else {
                electricPackage.isEnabled = true
                washPackage.isEnabled = true
            }

        }
    }
    var starterCars = StarterCars()
    var carIndexPointer = 1

    
    var car: Car? {
        didSet {
            CarStatistics.text = car?.displayStats()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        car = starterCars.cars[carIndexPointer]
        print(carIndexPointer)
        CarStatistics.text = car?.displayStats()
        remainingFunds = 1000
    }
    
    @IBAction func cycleCar(_ sender: Any) {
        if carIndexPointer >= starterCars.cars.count-1 {
            carIndexPointer = 0
        }else{
            carIndexPointer += 1
        }
        car = starterCars.cars[carIndexPointer]
        engineAndExhaustPackage.setOn(false, animated: true)
        tyresPackage.setOn(false, animated: true)
        electricPackage.setOn(false, animated: true)
        washPackage.setOn(false, animated: true)
        remainingFunds = 1000
    }
    
    @IBAction func engineAndExhaustToggle(_ sender: Any) {
        if engineAndExhaustPackage.isOn {
            car?.topSpeed += 5
            remainingFunds -= 500
        } else {
            car?.topSpeed -= 5
            remainingFunds += 500
        }
    }
    @IBAction func tyresPackageToggle(_ sender: Any) {
        if tyresPackage.isOn {
            car?.handling += 1
            remainingFunds -= 500
        } else {
            car?.handling -= 1
            remainingFunds += 500
        }
        
    }
    
    @IBAction func electricPackageToggle(_ sender: Any) {
        if electricPackage.isOn {
            car?.acceleration += 3
            remainingFunds -= 200
        } else {
            car?.acceleration -= 3
            remainingFunds += 200
        }
    }
    
    @IBAction func washPackageToggle(_ sender: Any) {
        if washPackage.isOn {
            remainingFunds -= 200
        } else {
            remainingFunds += 200
        }

    }
    
    
}

