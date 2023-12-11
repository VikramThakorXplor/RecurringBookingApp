//
//  EmphasizedLayout.swift
//  RecurringBookingApp
//
//  Created by Vikram Thakor on 10/12/23.
//

import SwiftUI

struct EmphasizedLayout: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.clear) // Change the background color here
            .cornerRadius(20)
            .padding(10)
    }
}

#Preview {
    EmphasizedLayout() as! any View
}
