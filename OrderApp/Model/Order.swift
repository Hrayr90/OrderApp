//
//  Order.swift
//  OrderApp
//
//  Created by Hrayr  Hakobyan on 31.01.22.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]

    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
