//
//  ChildData.swift
//  RecurringBookingApp
//
//  Created by Vikram Thakor on 10/12/23.
//

import SwiftUI
import Foundation
struct ChildData : Codable {
    let children : [Children]?

    enum CodingKeys: String, CodingKey {

        case children = "children"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        children = try values.decodeIfPresent([Children].self, forKey: .children)
    }

}
