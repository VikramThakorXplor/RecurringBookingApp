//
//  BookingRoomsData.swift
//  RecurringBookingApp
//
//  Created by Vikram Thakor on 11/12/23.
//

import SwiftUI
import Foundation
struct BookingRoomsData : Codable {
    let bookingRooms : [BookingRooms]?

    enum CodingKeys: String, CodingKey {

        case bookingRooms = "bookingRooms"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        bookingRooms = try values.decodeIfPresent([BookingRooms].self, forKey: .bookingRooms)
    }

}
