//
//  ViewController.swift
//  Homework5
//
//  Created by İsmail Nermiş on 22.09.2023.
//

import UIKit

class Calculator: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var firstNumber : Double = 0
    var secondNumber : Double = 0
    var operation : String = ""
    var done : Bool = false
    var operationCount = 0
    var equalCount = 0
    var numberCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func solveProblem() {
        if let problem = resultLabel.text {
            let split = problem.split(separator: operation)
                firstNumber = Double(split[0])!
                secondNumber = Double(split[1])!
        }
        switch operation {
        case "+":
            resultLabel.text = "\(firstNumber + secondNumber)"
        case "-":
            resultLabel.text = "\(firstNumber - secondNumber)"
        case "x":
            resultLabel.text = "\(firstNumber * secondNumber)"
        case "÷":
            if secondNumber != 0 {
                resultLabel.text = "\(firstNumber / secondNumber)"
            }else{
                
                resultLabel.text = "Error dividing by 0"
            }
        default:
            return
        }
        done = true
    }
    
    @IBAction func buttonNumbers(_ sender: UIButton) {
            if done {
                if let buttonText = sender.titleLabel?.text{
                    if buttonText != "+" && buttonText != "-" && buttonText != "x" && buttonText != "÷" {
                        resultLabel.text = ""
                        firstNumber = 0
                        secondNumber = 0
                        operation = ""
                        done = false
                        operationCount = 0
                        equalCount = 0
                        numberCount += 1
                        resultLabel.text! += buttonText
                        
                    }
                }
            }else{
                if let buttonText = sender.titleLabel?.text {
                    if buttonText != "+" && buttonText != "-" && buttonText != "x" && buttonText != "÷" {
                        resultLabel.text! += buttonText
                        numberCount += 1
                        
                    }else{
                        operationCount += 1
                        if operationCount < 2 && numberCount != 0 {
                            operation = buttonText
                            resultLabel.text! += buttonText
                        }else{
                            
                        }
                    }
                }
            }
    }
    
    @IBAction func buttonEqual(_ sender: UIButton) {
        if equalCount == 0 && operationCount == 1{
            equalCount += 1
            solveProblem()
            numberCount = 0
        }
    }
    
    @IBAction func buttonClear(_ sender: UIButton) {
        resultLabel.text = ""
        firstNumber = 0
        secondNumber = 0
        operation = ""
        operationCount = 0
        equalCount = 0
        
    }
}

