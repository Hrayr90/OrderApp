//
//  MenuController.swift
//  OrderApp
//
//  Created by Hrayr  Hakobyan on 08.02.22.
//

import Foundation

class MenuController {
    let baseURL = URL(string: "http://localhost:8080/")
    
    func fetchCategories() async throws -> [String] {
    }
    
    func fetchMenuItams(forCategary categoryName: String) async throws -> [MenuItem] {
    }
    
    typealias MinutesToPrepare = Int
    
    func submitOrder(forMenuIDs menuIDs: [Int]) async throws -> MinutesToPrepare {
    }
}

enum MenuControllerError: Error, LocalizedError {
    case categoriesNotFound
    case menuItemsNotFound
    case orderRequestFailed
}

