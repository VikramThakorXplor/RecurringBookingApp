//
//  RadioButtonWithText.swift
//  RecurringBookingApp
//
//  Created by Vikram Thakor on 11/12/23.
//

import SwiftUI

struct RadioButtonWithText: View {
    @Binding var isSelected: Bool
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                .onTapGesture {
                    isSelected.toggle()
                }
            Text(text)
        }
    }
}

struct RadioButtonWithText_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
