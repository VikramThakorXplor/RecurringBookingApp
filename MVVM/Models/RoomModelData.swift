//
//  RoomModelData.swift
//  RecurringBookingApp
//
//  Created by Vikram Thakor on 12/12/23.
//

import SwiftUI
import Foundation

struct RoomModelData : Codable {
    let data : BookingRoomsData?
    let id : String?
    let displayName : String?
    let version : Int?

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case id = "id"
        case displayName = "displayName"
        case version = "version"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(BookingRoomsData.self, forKey: .data)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        displayName = try values.decodeIfPresent(String.self, forKey: .displayName)
        version = try values.decodeIfPresent(Int.self, forKey: .version)
    }

}

