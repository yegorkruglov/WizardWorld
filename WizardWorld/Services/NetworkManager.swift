//
//  NetworkManager.swift
//  WizardWorld
//
//  Created by Egor Kruglov on 21.06.2023.
//

import Foundation
import Alamofire

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
    
    func fetchImage(from url: URL, completion: @escaping(Result<Data, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseData { dataResponse in
                switch dataResponse.result {
                case .success(let imageData):
                    completion(.success(imageData))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func fetchWizards(from url: URL, completion: @escaping(Result<[Wizard], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let wizards = Wizard.getWizards(from: value)
                    completion(.success(wizards))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func fetchSpells(from url: URL, completion: @escaping(Result<[Spell], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let spells = Spell.getSpells(from: value)
                    completion(.success(spells))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func fetchElixirs(from url: URL, completion: @escaping(Result<[Elixir], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let elixirs = Elixir.getElixirs(from: value)
                    completion(.success(elixirs))
                    
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func fetchHouses(from url: URL, completion: @escaping(Result<[House], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let houses = House.getHouses(from: value)
                    completion(.success(houses))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
