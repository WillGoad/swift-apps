//
//  ViewController.swift
//  100Phrases
//
//  Created by Goad, William (PAH) on 11/03/2020.
//  Copyright © 2020 Goad, William (PAH). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        french.phraseCreator(baseSentence: "Where is", baseSentenceTranslated: "Où est", wordCloud: ["the gym", "the hotel", "the restaurant"], wordCloudTranslated: ["la salle de gym","l'hotel","le restaurant"])
        
        print(french.phrases[0].baseSentenceTranslated)
    }

    var french = Language(name: "French")

        

}

