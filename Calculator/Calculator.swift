//
//  Calculator.swift
//  Calculator
//
//  Created by Dante Cesa on 12/24/21.
//

import Foundation

struct Calculator {
    var output: String = "0"
    var stagedOperation: String = ""
    var operandSet: Bool = false
    var operand: String = ""
    var replaceCalcOutput: Bool = true

    mutating func reset() {
        output = "0"
        stagedOperation = ""
        replaceCalcOutput = true
    }
    
    mutating func invert() {
        var value1: String
        var value2: String
        
        (value1, value2) = isolateOperands()
        
        if value1.isEmpty {
            return
        } else if value2.isEmpty {
            value1 = String(-Double(value1)!)
            stagedOperation = value1
            output = value1
        } else {
            value2 = String(-Double(value2)!)
            stagedOperation = value1 + " " + value2
            output = value2
        }
    }
    
    mutating func percentage() {
        var value1: String
        var value2: String
        
        (value1, value2) = isolateOperands()
        
        if value1.isEmpty {
            return
        } else if value2.isEmpty {
            value1 = String(Double(value1)!/100)
            stagedOperation = value1
            output = value1
        } else {
            value2 = String(Double(value2)!/100)
            stagedOperation = value1 + " " + value2
            output = value2
        }
    }
    
    mutating func performCalculation() {
        // We only do math if (1) we have an operand (+-*/) staged, (2) if our last action is *not* a operand, & (3) if we have enough characters in our operand to do some math – which would be 3 chars, e.g. 1+1 would equate ("1 1" in staged operation).
        if operandSet == true && stagedOperation.last != " " && stagedOperation.count > 2 {
            var result: Double = 0.0
            var value1: String
            var value2: String
            var divideByZeroError: Bool = false
            
            // Parses our string into two string values we can work on.
            (value1, value2) = isolateOperands()
            
            print("We're doing some math")
            
            switch operand {
            case "+":
                result = Double(value1)! + Double(value2)!
            case "-":
                result = Double(value1)! - Double(value2)!
            case "x":
                result = Double(value1)! * Double(value2)!
            case "÷":
                if value1 == "0" || value2 == "0" {
                    divideByZeroError = true
                } else {
                    result = Double(value1)! / Double(value2)!
                }
            default:
                print("Something went wrong")
            }
            
            // Check if we had a divide by zero number, otherwise proceed.
            if divideByZeroError == true {
                output = "Not a number"
                stagedOperation = ""
            } else {
                output = String(result)
                operandSet = false
                stagedOperation = ""
                print("The math we did was: \(output)")
                print("Staged operation is now: \(stagedOperation)")
                //stagedOperation = String(output)
            }
        }
        replaceCalcOutput = true
        }
    
    func isolateOperands() -> (String, String) {
        print("We're isolating operands")
        
        var value1: String = ""
        var value2: String = ""
        var foundSeparator: Bool = false
        
        // var stagedOperationArr = stagedOperation.components(separatedBy: " ")
        // var value1 = Double(stagedOperation[0])
        // var value2 = Double(stagedOperation[1])
        
        for char in stagedOperation {
            if char != " " && foundSeparator == false {
                value1.append(char)
            } else if char != " " && foundSeparator == true {
                value2.append(char)
            } else {
                foundSeparator = true
            }
        }
        return (value1, value2)
    }
}

