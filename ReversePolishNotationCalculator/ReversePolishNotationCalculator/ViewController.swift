//
//  ViewController.swift
//  ReversePolishNotationCalculator
//
//  Created by Goad, William (PAH) on 10/06/2020.
//  Copyright © 2020 Goad, William (PAH). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var expressionStack = Stack()
    
    var positive = true
    var waitArray: [String] = []
    
    //Numbers
    
    @IBAction func Zero(_ sender: Any) {
        numPush(0)
    }
    
    @IBAction func One(_ sender: Any) {
        numPush(1)
    }
    
    @IBAction func Two(_ sender: Any) {
        numPush(2)
    }
    
    @IBAction func Three(_ sender: Any) {
        numPush(3)
    }
    
    @IBAction func Four(_ sender: Any) {
        numPush(4)
    }
    
    @IBAction func Five(_ sender: Any) {
        numPush(5)
    }
    
    @IBAction func Six(_ sender: Any) {
        numPush(6)
    }
    
    @IBAction func Seven(_ sender: Any) {
        numPush(7)
    }
    
    @IBAction func Eight(_ sender: Any) {
        numPush(8)
    }
    
    @IBAction func Nine(_ sender: Any) {
        numPush(9)
    }
    
    //Symbols
    
    @IBAction func Plus(_ sender: Any) {
        numPush(10)
    }
    
    @IBAction func Minus(_ sender: Any) {
        numPush(11)
    }
    
    @IBAction func Times(_ sender: Any) {
        numPush(12)
    }
    
    @IBAction func Divide(_ sender: Any) {
        numPush(13)
    }
    
    //Commands
    
    @IBAction func EVAL(_ sender: Any) {
  
    }
    
    @IBAction func ENTER(_ sender: Any) {
        finalPush()
    }
    
    @IBAction func SWITCHSIGNS(_ sender: Any) {
        positive = !positive
    }
    
    @IBAction func CLR(_ sender: Any) {
        expressionStack.wipe()
        displayCurrent()
        positive = true
    }
    
    //Display
    
    @IBOutlet var Display: UITextField!
    
    
   
    func numPush(_ num: Int) {
        var numbr = num
        if num == 10 {
            expressionStack.push(calculate("+"))
        }else if num == 11 {
            expressionStack.push(calculate("-"))
        }else if num == 12 {
            expressionStack.push(calculate("*"))
        }else if num == 13 {
            expressionStack.push(calculate("/"))
        }else {
            if positive == false {
                numbr = num * -1
            }
            waitArray.append(String(numbr))
        }
        displayCurrent()
    }
    
    func finalPush() {
        var final = ""
        for i in waitArray {
            final = final + i
        }
        if final != "" {
            expressionStack.push(Int(final) ?? 9999)
            waitArray = []
        }
        displayCurrent()

    }
    
    //print(String(expressionStack.pop() ?? "n"))
    
    
    func calculate(_ symbol: String) -> Int {
        
        let value1 = Int(expressionStack.pop() ?? 1)
        let value2 = Int(expressionStack.pop() ?? 1)
        var result = 1
        
        //Finding correct calculation to do
        if symbol == "+" {
            result = value1 + value2
        } else if symbol == "-" {
            result = value2 - value1
        } else if symbol == "*" {
            result = value1 * value2
        } else if symbol == "/" {
            result = value2 / value1
        } else {
            result = 1
            print("Unrecognised Symbol")
        }
        
        return result
    }
    
    func displayCurrent() {
        Display.text = expressionStack.show() + arraytoString(waitArray)
    }
    
    func arraytoString(_ array: [String]) -> String {
        var result = ""
        
        for element in array {
          result = result + String(element)
        }
        return result
    }


}

