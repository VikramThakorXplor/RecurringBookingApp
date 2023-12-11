//
//  BookingRooms.swift
//  RecurringBookingApp
//
//  Created by Vikram Thakor on 11/12/23.
//

import SwiftUI
import Foundation

struct BookingRooms : Codable {
    let fee : String?
    let endTime : String?
    let feeFkey : String?
    let roomFkey : String?
    let roomName : String?
    let startTime : String?

    enum CodingKeys: String, CodingKey {

        case fee = "fee"
        case endTime = "endTime"
        case feeFkey = "feeFkey"
        case roomFkey = "roomFkey"
        case roomName = "roomName"
        case startTime = "startTime"
    }
 
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        fee = try values.decodeIfPresent(String.self, forKey: .fee)
        endTime = try values.decodeIfPresent(String.self, forKey: .endTime)
        feeFkey = try values.decodeIfPresent(String.self, forKey: .feeFkey)
        roomFkey = try values.decodeIfPresent(String.self, forKey: .roomFkey)
        roomName = try values.decodeIfPresent(String.self, forKey: .roomName)
        startTime = try values.decodeIfPresent(String.self, forKey: .startTime)
    }

}

