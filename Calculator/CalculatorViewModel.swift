//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Dante Cesa on 12/24/21.
//

import Foundation

class CalculatorViewModel: ObservableObject {
    @Published var calc = Calculator()
    
    var buttonRowDictionary: [Int:[String]] = [
        0:["A/C", "+/-", "%", "÷"],
        1:["7", "8", "9", "x"],
        2:["4", "5", "6", "-"],
        3:["1", "2", "3", "+"],
        4:["0", ".", "="]
    ]
    
    func getOutput() -> String {
        return calc.output
    }
    
    func addOperand(_ input: String) {            
        if input == "+" || input == "-" || input == "x" || input == "÷" {
            
            // Restores the last value back into stagedOperation should the user type an operand without typing in a new number.
            if calc.stagedOperation == "" {
                print("hi")
                if calc.output != "Not a number" {
                    print("bye")
                    calc.stagedOperation = calc.output
                }
            }
            
            // Checks if we have to do math prior
            let tuple = calc.isolateOperands()
            if !tuple.0.isEmpty && !tuple.1.isEmpty {
                calc.performCalculation()
                if calc.output != "Not a number" {
                    calc.stagedOperation = calc.output
                }
            }
            
            calc.operandSet = true
            calc.operand = input
            
            // We demarcate that an operand is set with a " ". This prevents us from adding two concurrent separators.
            if calc.stagedOperation.count > 0 {
                if calc.stagedOperation.last != " " {
                    calc.stagedOperation.append(" ")
                }
            }
            calc.replaceCalcOutput = true
        } else {
            calc.stagedOperation.append(input)
            updateOutput(input: input)
        }
        print("Staged operation is now: \"\(stagedOperation())\"")
    }

    func performCalculation() {
        calc.performCalculation()
    }
    
    func stagedOperation() -> String {
        return calc.stagedOperation
    }

    // Determines when we append values to our calculator's "display". E.g. when we're typing a value that's greater than 1 digit vs. when we need to replace the value entirely (e.g. when we're entering a second value).
    func updateOutput(input: String) {
        if calc.replaceCalcOutput == true {
            calc.output = input
            calc.replaceCalcOutput = false
        } else {
            calc.output.append(input)
        }
    }
    
    // Resets the calculator back to zero.
    func clear() {
        calc.reset()
        print("Clearing everything")
        print("StagedOperation is now: \"\(stagedOperation())\"")
    }
    
    func invert() {
        calc.invert()
    }
    
    func percentage() {
        calc.percentage()
    }
}
