//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by MAC on 9/22/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

// Xcode 11 with dark mode
struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double?, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            switch symbol {
            case "+/-" :
                return n * -1
            case "AC" :
                return 0
            case "%" :
                return n * 0.01
            case "=" :
                return performTwoNumCalculations(n2: n)
            default:
                intermediateCalculation = (n1:n, calcMethod:symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculations(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1,
            let operation = intermediateCalculation?.calcMethod {
            
            switch operation {
            case "+" :
                return n1 + n2
            case "-" :
                return n1 - n2
            case "×" :
                return n1 * n2
            case "÷" :
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the case")
            }
        }
        return nil
    }
}
