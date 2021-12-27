//
//  numeralButtonView.swift
//  Calculator
//
//  Created by Dante Cesa on 12/26/21.
//

import SwiftUI

struct NumeralButtonView: View {
    @EnvironmentObject var viewModel: CalculatorViewModel
    let withText: String

    var body: some View {
        
        // We special case here to make a larger "0" button.
        if withText == "0" {
            Button(
                action: { numeralFunction() },
                label: {
                    Text("\(withText)")
                        .bold()
                        .frame(minWidth: 140, minHeight: 50, alignment: .center)
                        .font(.title)
                        .padding()
                        .background(.purple)
                        .clipShape(Capsule())
                        .clipShape(RoundedRectangle(cornerRadius: 20))
            })
        } else {
            Button(
                action: { numeralFunction() },
                label: {
                    Text("\(withText)")
                        .bold()
                        .frame(minWidth: 50, minHeight: 50, alignment: .center)
                        .font(.title)
                        .padding()
                        .background(.purple)
                        .clipShape(Capsule())
                        .clipShape(RoundedRectangle(cornerRadius: 20))
            })
        }
    }
    
    private func numeralFunction() {
        print("We tapped \"\(withText)\"")
        viewModel.addOperand(withText)
    }
}

struct numeralButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NumeralButtonView(withText: "With text…")
    }
}
