//
//  NetworkManager.swift
//  MyRecipeBook
//
//  Created by April (Huaiyu) Zhang on 8/20/24.
//  
//

import Foundation

// getAllCategories
// getRecipeForCategory
// getRecipeDeatils
enum NetworkError: Error {
    case badRequest
    case decodingError
}

class NetworkManager {
    func get<T: Decodable>(url: URL, parse: (Data) -> T?) async throws -> T {
        
        let (data, response) = try await URLSession.shared.data(from:url)
        
        if (response as? HTTPURLResponse)?.statusCode != 200 {
            throw NetworkError.badRequest
        }
        
        guard let result = parse(data) else {
            throw NetworkError.decodingError
        }
        return result
    }
}
