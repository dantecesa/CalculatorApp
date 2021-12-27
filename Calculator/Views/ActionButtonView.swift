//
//  actionButtonView.swift
//  Calculator
//
//  Created by Dante Cesa on 12/26/21.
//

import SwiftUI

struct ActionButtonView: View {
    var withFunction: () -> Void
    let withText: String
    
    var body: some View {   
        Button(
            action: withFunction,
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

struct actionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ActionButtonView(withFunction: {}, withText: "With text…")
    }
}
