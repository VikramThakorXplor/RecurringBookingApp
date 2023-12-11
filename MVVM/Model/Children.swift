//
//  SwiftUIView.swift
//  RecurringBookingApp
//
//  Created by Vikram Thakor on 10/12/23.
//

import SwiftUI
import Foundation
struct Children : Codable {
    let age : Int?
    let fkey : String?
    let fullName : String?
    let availableRoomsId : String?

    enum CodingKeys: String, CodingKey {

        case age = "age"
        case fkey = "fkey"
        case fullName = "fullName"
        case availableRoomsId = "availableRoomsId"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        age = try values.decodeIfPresent(Int.self, forKey: .age)
        fkey = try values.decodeIfPresent(String.self, forKey: .fkey)
        fullName = try values.decodeIfPresent(String.self, forKey: .fullName)
        availableRoomsId = try values.decodeIfPresent(String.self, forKey: .availableRoomsId)
    }

}
