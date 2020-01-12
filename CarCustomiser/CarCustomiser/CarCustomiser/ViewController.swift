//
//  ViewController.swift
//  CarCustomiser
//
//  Created by Goad, William (PAH) on 11/01/2020.
//  Copyright © 2020 Goad, William (PAH). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var CarStatistics: UILabel!
    
    var car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7,
                  handling: 5)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        CarStatistics.text = car.displayStats()
    }


}

