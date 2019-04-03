//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Benjamin on 2019-04-01.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number : Double?
    
    private var intermediaCalculation : (firstNumber : Double, operation : String)?
    
    mutating func setNumber(_ number : Double) {
        self.number = number
    }
    
      mutating func calculate (symbol : String) -> Double? {
      
        
            if let n = number {
                switch symbol {
                case "+/-":
                    return n * -1
                case "AC":
                    return 0
                case "%":
                    return n * 0.01
                case "=":
                  return  performTwoNumberCalculation(secondNumber: n)
                default:
                    intermediaCalculation = (firstNumber : n, operation : symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumberCalculation(secondNumber n2 : Double) -> Double? {
     
        if let n1 = intermediaCalculation?.firstNumber, let operation = intermediaCalculation?.operation {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                 fatalError("operation passed in doesnt match calculation")
            }
        }
        return nil
    }
}
