//
//  OperandButtonView.swift
//  Calculator
//
//  Created by Dante Cesa on 12/26/21.
//

import SwiftUI

struct OperandButtonView: View {
    @EnvironmentObject var viewModel: CalculatorViewModel
    let withText: String
    
    var body: some View {
        Button(
            action: { whichFunction() },
            label: {
                Text("\(withText)")
                    .bold()
                    .frame(minWidth: 50, minHeight: 50, alignment: .center)
                    .font(.largeTitle)
                    .padding()
                    .background(.cyan)
                    .clipShape(Capsule())
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            })
    }
    
    // If our button is "=" let's call a function to do our claculation, otherwise let's print to the console what button was pressed && call a method to stage the input.
    func whichFunction() -> () {
        if withText == "=" {
            viewModel.performCalculation()
        } else {
            print("We tapped \"\(withText)\"")
            viewModel.addOperand(withText)
        }
    }
}

struct OperandButtonView_Previews: PreviewProvider {
    static var previews: some View {
        OperandButtonView(withText: "With text…")
    }
}
