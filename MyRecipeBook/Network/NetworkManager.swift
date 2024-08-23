//
//  NetworkManager.swift
//  MyRecipeBook
//
//  Created by April (Huaiyu) Zhang on 8/20/24.
//  
//

import Foundation

enum NetworkError: Error {
    case badRequest(statusCode: Int)
    case decodingError
    case noData
    case invalidResponse
    case unknownError
}

class NetworkManager {
    func get<T: Decodable>(url: URL, parse: (Data) -> T?) async throws -> T {
        
        let (data, response) = try await URLSession.shared.data(from:url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        if httpResponse.statusCode != 200 {
            throw NetworkError.badRequest(statusCode: httpResponse.statusCode)
        }
        
        guard !data.isEmpty else {
            throw NetworkError.noData
        }
        
        guard let result = parse(data) else {
            throw NetworkError.decodingError
        }
        
        return result
    }
}

