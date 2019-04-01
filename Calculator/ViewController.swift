//
//  ViewController.swift
//  Calculator
//
//  Created by Benjamin Aronsson on 01/04/2019.
//  Copyright © 2018 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber : Bool = true
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
       
        isFinishedTypingNumber = true
        
        guard let number = Double (displayLabel.text!) else {fatalError("Cannot convert display label to double")}
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayLabel.text = String(number * -1)
            }
            else if calcMethod == "AC" {
                displayLabel.text = "0"
            }
            else if calcMethod == "%" {
                displayLabel.text = String(number * 0.01)
            }
        }
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            }
            else {
                
                if numValue == "." {
                    
                    guard let currentDisplayLabel = Double (displayLabel.text!) else {fatalError("Cannot convert display label to double")}
                    
                    let isInt = floor(currentDisplayLabel) == currentDisplayLabel
                    
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! +  numValue
            }
            
            
        }
    
    }

}

