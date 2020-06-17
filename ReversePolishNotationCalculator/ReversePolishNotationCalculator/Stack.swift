

import Foundation

class Stack {
    
    var array: [Int] = []
    
    func push(_ element: Int) {
        
        array.append(element);
        
    }
    
    func pop() -> Int? {
        
        return array.popLast()
        
    }
    
    func peek() -> Int? {
        
        return array.last
        
    }
    
    func show() -> String {
        var result = ""
        
        for element in array {
          result = result + String(element)
        }
        return result
    }
    
    func wipe() {
        array.removeAll()
    }
    
    
    
}
