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
    @Published var borderLineWidth: CGFloat = 1.5
    @Published var borderRadius: CGFloat = 3.0
    @Published var strSelectedChild: String = ""
    @Published var strSelectedChildID: UUID?
    @Published var strSelectedTime: String = ""
    @Published var strURLChildrenParam: String = "076c0cb9-c60e-48eb-a447-77e85b700d94"
    @Published var arrChildren : [Children]?
    @Published var arrRooms : [BookingRooms]?
    @Published var enableedColor: Color = (Color(uiColor: UIColor(red: 0.262745098, green: 0.2941176471, blue: 0.6588235294, alpha: 1)))
    @Published var disbaledColor: Color = (Color(uiColor: UIColor(red: 0.262745098, green: 0.2941176471, blue: 0.6588235294, alpha: 1)))
    @State    var showLoadingIndicator: Bool = true

      func convertDateAndTime(timeString: String) -> String? {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ssZ"
            dateFormatter.amSymbol = "am"
            dateFormatter.pmSymbol = "pm"
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            guard let date = dateFormatter.date(from: timeString) else {
                return nil
            }
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = "ha"
            let formattedTime = dateFormatter.string(from: date)
            return formattedTime
        }
    
    
 }

