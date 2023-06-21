//
//  NetworkManager.swift
//  WizardWorld
//
//  Created by Egor Kruglov on 21.06.2023.
//

import Foundation

// MARK: - Enums
enum Link {
    case houses
    case spells
    case elixirs
    case wizards
    
    var url: URL {
        switch self {
        case .houses:
            return URL(string: "https://wizard-world-api.herokuapp.com/Houses")!
        case .spells:
            return URL(string: "https://hp-api.onrender.com/api/spells")!
        case .elixirs:
            return URL(string: "https://wizard-world-api.herokuapp.com/Elixirs")!
        case .wizards:
            return URL(string: "https://hp-api.onrender.com/api/characters")!
        }
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

// MARK: - NetworkManager
final class NetworkManager {
    static let shared = NetworkManager()
    
    private init () {}
    
    func fetch<T: Decodable>(_ type: T.Type, from url: URL, completion: @escaping(Result<T, NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let dataModel = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(dataModel))
                }
            } catch {
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
}
