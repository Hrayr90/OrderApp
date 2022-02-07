//
//  OrderResponse.swift
//  OrderApp
//
//  Created by Hrayr  Hakobyan on 31.01.22.
//

import Foundation

struct OrderResponse: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
