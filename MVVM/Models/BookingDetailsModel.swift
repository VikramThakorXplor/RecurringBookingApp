//
//  BookingDetailsModel.swift
//  RecurringBookingApp
//
//  Created by Vikram Thakor on 11/12/23.
//

import SwiftUI

 
class BookingDetailsModel {
    var childName: String = ""
    var selectedTime: String = ""
    var startDate: Date = Date()
    var endDate: Date = Date()
    var selectedDays: [String] = [String]()
    var childID: String = ""
    var roomID: String = ""
    
    init(childName: String, selectedTime: String, startDate: Date, endDate: Date, selectedDays: [String], childID: String, roomID: String) {
        self.childName = childName
        self.selectedTime = selectedTime
        self.startDate = startDate
        self.endDate = endDate
        self.selectedDays = selectedDays
        self.childID = childID
        self.roomID = roomID
    }
}
