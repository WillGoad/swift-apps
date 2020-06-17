//
//  Stack.swift
//  RevPolNotCalc
//
//  Created by Goad, William (PAH) on 10/06/2020.
//  Copyright © 2020 Goad, William (PAH). All rights reserved.
//

import Foundation

class Stack {
    
    var array: [String] = []
    
    func push(_ element: String) {
        
        array.append(element);
        
    }
    
    func pop() -> String? {
        
        return array.popLast()
        
    }
    
    func peek() -> String? {
        
        return array.last
        
    }
    
    
    
}
