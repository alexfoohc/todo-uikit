//
//  ServiceManager.swift
//  Ejercicio-UIKit
//
//  Created by Alejandro Hernandez on 15/09/23.
//

import Foundation


enum ServiceError: Error {
    case invalidURL
    case serverError
    case invalidData
}

class ServiceManager {
        
    func fetchItems<T:Codable>(url: String) async throws -> T {
        guard let url = URL(string: url) else {throw ServiceError.invalidURL}
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ServiceError.serverError
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw ServiceError.invalidData
        }
    }
}
