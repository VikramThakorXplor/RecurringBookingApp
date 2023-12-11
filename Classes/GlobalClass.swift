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
    @Published var enableedColor: Color = (Color(uiColor: UIColor(red: 0.262745098, green: 0.2941176471, blue: 0.6588235294, alpha: 1)))
    @Published var disbaledColor: Color = (Color(uiColor: UIColor(red: 0.262745098, green: 0.2941176471, blue: 0.6588235294, alpha: 1)))
 }
