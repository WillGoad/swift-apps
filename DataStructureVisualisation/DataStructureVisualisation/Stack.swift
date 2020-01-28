//
//  Stack.swift
//  DataStructureVisualisation
//
//  Created by Goad, William (PAH) on 28/01/2020.
//  Copyright © 2020 Goad, William (PAH). All rights reserved.
//

import Foundation

class Stack {
    var stack = Array(repeating: 0, count: 10)
    var top = -1
    
    func pop() -> Int?{
        if top >= -1 {
            top -= 1
            return stack[top + 1]
        } else {
            print("ERROR: Can't Pop when stack is empty!")
            return nil
        }
    }
    
    func push(_ item: Int){
        if top <= 10 {
            top += 1
            stack[top] = item
        } else {
            print("ERROR: Can't push when stack full!")
        }
    }
    
    func peek() -> Int?{
        if top <= -1 {
            return stack[top]
        } else {
            print("ERROR: Can't peek when stack is empty")
            return nil
        }
    }
    
    func display(){
        if top >= -1{
            print("Stack:")
            for i in stride(from: top, to: -1, by: -1) {
              print("-" + String(stack[i]))
            }
        }
    }

}

