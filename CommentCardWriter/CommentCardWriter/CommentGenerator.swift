//
//  CommentGenerator.swift
//  CommentCardWriter
//
//  Created by Goad, William (PAH) on 11/02/2020.
//  Copyright © 2020 Goad, William (PAH). All rights reserved.
//

import Foundation

class CommentGenerator {
    
    
    static func generate(subject: String, levelOfEnjoyment: Int, paceSatisfaction: Int, weakness: String, strength: String, additionalComments: String?) -> Comment{
        var enjoyText = ""
        var paceText = ""
        
        
        switch levelOfEnjoyment {
        case 0:
            enjoyText = "not enjoying"
        case 1:
            enjoyText = "enjoying"
        case 2:
            enjoyText = "loving"
        default:
            print("ERROR: level of Enjoyment is not in range")
        }
        
        switch paceSatisfaction {
        case 0:
            paceText = "too slow"
        case 1:
            paceText = "ok"
        case 2:
            paceText = "too fast"
        default:
            print("ERROR: pace Satisfaction is not in range")
        }
        
        let finalstring = "I am currently \(enjoyText) \(subject). I find the pace of lessons at the moment to be \(paceText) for me. At this point I would say my greatest strength in class is \(strength) and my main weakness is \(weakness). \(additionalComments ?? "")"
        
        
        return Comment(content: finalstring)
    }
}
