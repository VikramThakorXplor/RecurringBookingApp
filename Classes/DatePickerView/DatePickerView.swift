//
//  DatePickerView.swift
//  RecurringBookingApp
//
//  Created by Vikram Thakor on 09/12/23.
//

import SwiftUI
import Observation

struct DatePickerView: View {
    @State private var selectedDate = Date()
    
    @State private var wakeup = Date.now
    @State var tag = 0
    @State static var date = Date()
    let minDate = Calendar.current.date(byAdding: .year, value: -1, to: Date())! // Set minimum date
    
    var body: some View {
        
        DatePicker("Select a date", selection: $selectedDate, in: Date.now..., displayedComponents: .date)
            .labelsHidden() // Hide the default labels if desired
            .padding()
    }
}

#Preview {
    DatePickerView()
}
