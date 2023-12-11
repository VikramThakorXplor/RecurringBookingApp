//
//  GlobalClass.swift
//  RecurringBookingApp
//
//  Created by Vikram Thakor on 10/12/23.
//

import SwiftUI
import Combine

class GlobalClass: ObservableObject {
    @Published var arrSelectedDays: [String] = [String]()
    @Published var borderLineWidth: CGFloat = 1.0
    @Published var borderRadius: CGFloat = 1.0
    @Published var strSelectedChild: String = ""
    @Published var strSelectedTime: String = ""
 }
