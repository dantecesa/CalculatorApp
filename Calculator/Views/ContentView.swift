//
//  ContentView.swift
//  Calculator
//
//  Created by Dante Cesa on 12/24/21.
//

import SwiftUI

var mainColor = Color.black

struct ContentView: View {
    @StateObject var viewModel = CalculatorViewModel()
    
    var body: some View {
        ZStack {
            mainColor.ignoresSafeArea()
            VStack{
                Text("\(viewModel.getOutput())")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                ForEach(0..<viewModel.buttonRowDictionary.keys.count) { row in
                    HStack {
                        ForEach(0..<viewModel.buttonRowDictionary[row]!.count) { buttonItem in
                            let buttonText = viewModel.buttonRowDictionary[row]![buttonItem]
                        
                            switch buttonText {
                            case "A/C":
                                ActionButtonView(withFunction: { viewModel.clear() }, withText: buttonText)
                            case "+/-":
                                ActionButtonView(withFunction: { viewModel.invert() }, withText: buttonText)
                            case "%":
                                ActionButtonView(withFunction: { viewModel.percentage() }, withText: buttonText)
                            case let x where x == "÷" || x == "x" || x == "-" || x == "+":
                                OperandButtonView(withText: buttonText)
                            case "=":
                                OperandButtonView(withText: buttonText)
                            default:
                                NumeralButtonView(withText: buttonText)
                            }
                        }
                    }
                }
            }.foregroundColor(.white).environmentObject(viewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
