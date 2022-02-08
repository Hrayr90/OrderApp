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
        let categoriesURL = baseURL?.appendingPathComponent("categories")
        let (dat, response) = try await URLSession.shared.data(from: categoriesURL)
    }
    
    func fetchMenuItams(forCategary categoryName: String) async throws -> [MenuItem] {
        let baseMenuURL = baseURL?.appendingPathComponent("menu")
        var components = URLComponents(url: baseMenuURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "category", value: categoryName)]
        let menuURL = components.url!
        let (data, response) = try await URLSession.shared.data(from: menuURL)
    }
    
    typealias MinutesToPrepare = Int
    
    func submitOrder(forMenuIDs menuIDs: [Int]) async throws -> MinutesToPrepare {
        let orderURL = baseURL?.appendingPathComponent("order")
        var request = URLRequest(url: orderURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let menuIdsDict = ["menuIds": menuIDs]
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(menuIdsDict)
        request.httpBody = jsonEncoder
        
        let (data, response) = try await URLSession.shared.data(from: request)
    }
}

enum MenuControllerError: Error, LocalizedError {
    case categoriesNotFound
    case menuItemsNotFound
    case orderRequestFailed
}


