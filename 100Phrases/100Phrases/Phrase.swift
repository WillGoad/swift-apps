//
//  Phrase.swift
//  100Phrases
//
//  Created by Goad, William (PAH) on 11/03/2020.
//  Copyright © 2020 Goad, William (PAH). All rights reserved.
//

import Foundation

class Phrase {
    let baseSentence: String
    let wordCloud: [String]
    let baseSentenceTranslated: String
    let wordCloudTranslated: [String]

    var answeredCorrectly: Int = 0
    
    init(baseSentence: String, baseSentenceTranslated: String, wordCloud: [String], wordCloudTranslated: [String]) {
        self.baseSentence = baseSentence
        self.wordCloud = wordCloud
        self.baseSentenceTranslated = baseSentenceTranslated
        self.wordCloudTranslated = wordCloudTranslated
    }
}
