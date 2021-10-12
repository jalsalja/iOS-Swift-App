//
//  SecondViewController.swift -> CalculatorViewController.swift
//  Homework1
//
//  Created by Anna Han on 9/5/20.
//  Copyright © 2020 Boise State. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    
    @IBOutlet weak var display: UILabel!
    
    var result = Float()
    var currentNumber = Float()
    var currentOperation = String()
    
    
    var userIsTyping = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentOperation = "="
        display.text = ("\(result)")
    }

    @IBAction func touchDigit(_ sender: UIButton) {


        currentNumber = currentNumber * 10 +  Float(sender.currentTitle!)!
       display.text = ("\(currentNumber)")

    }
    @IBAction func operationButton(_ sender: UIButton) {
        switch currentOperation {
            case "=":
                result = currentNumber
            case "+":
                result = result + currentNumber
            case "-":
                result = result - currentNumber
            case "x":
                result = result * currentNumber
            case "/":
                result = result / currentNumber
            default:
               print("error")
        }
        currentNumber = 0
        display.text = ("\(result)")
        if(sender.titleLabel!.text == "="){
            result = 0
        }
        
        currentOperation = sender.titleLabel!.text! as String
        
    }
    
    
    @IBAction func operationClear(_ sender: UIButton) {
        result = 0
        currentNumber = 0
        currentOperation = "="
        display.text = ("\(result)")
    }
    
    
    
}

