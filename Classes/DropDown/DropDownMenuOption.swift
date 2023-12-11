//
//  DropDownMenuOption.swift
//  RecurringBookingApp
//
//  Created by Vikram Thakor on 09/12/23.
//

import SwiftUI
import Foundation

struct DropDownMenuOption: Identifiable, Hashable {
    var id = UUID().uuidString
    var option: String
  
}
 
extension DropDownMenuOption {
    static let single: DropDownMenuOption = DropDownMenuOption(option: "John Single")
    static let arrChildren : [DropDownMenuOption] = [DropDownMenuOption(option: "John"),DropDownMenuOption(option: "John1"),DropDownMenuOption(option: "John2")]
    
    static let arrSchoolTime : [DropDownMenuOption] = [DropDownMenuOption(option:  "Before school care - 5am - 8:30am"),DropDownMenuOption(option:  "Before school care - 5am - 8:30am"),DropDownMenuOption(option:  "Before school care - 5am - 8:30am"),DropDownMenuOption(option:  "Before school care - 5am - 8:30am"),DropDownMenuOption(option:  "Before school care - 5am - 8:30am"),DropDownMenuOption(option:  "Before school care - 5am - 8:30am"),DropDownMenuOption(option:  "Before school care - 5am - 8:30am"),DropDownMenuOption(option:  "Before school care - 5am - 8:30am"),DropDownMenuOption(option:  "Before school care - 5am - 8:30am")]
}
