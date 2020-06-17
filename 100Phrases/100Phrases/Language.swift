//
//  Language.swift
//  100Phrases
//
//  Created by Goad, William (PAH) on 11/03/2020.
//  Copyright © 2020 Goad, William (PAH). All rights reserved.
//

import Foundation

class Language {
    var phrases: [Phrase] = []
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func phraseCreator(baseSentence: String, baseSentenceTranslated: String, wordCloud: [String], wordCloudTranslated: [String]) {
        phrases.append(Phrase(baseSentence: baseSentence, baseSentenceTranslated: baseSentenceTranslated, wordCloud: wordCloud, wordCloudTranslated: wordCloudTranslated))
        }
}
