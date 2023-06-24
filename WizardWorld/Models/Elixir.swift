//
//  Elixir.swift
//  WizardWorld
//
//  Created by Egor Kruglov on 21.06.2023.
//

import Foundation

struct Elixir: Decodable {
    let id: String
    let name: String
    let effect, sideEffects, characteristics: String?
    let ingredients: [Ingredient]
    
    init(elixirData: [String: Any]) {
        id = elixirData["id"] as? String ?? "Unknown"
        name = elixirData["name"] as? String ?? "Unknown"
        effect = elixirData["effect"] as? String ?? "Unknown"
        sideEffects = elixirData["sideEffects"] as? String ?? "Unknown"
        characteristics = elixirData["characteristics"] as? String ?? "Unknown"
        let ingredientsData = elixirData["ingredients"] as? [[String: Any]] ?? [[:]]
        ingredients = Ingredient.getIngredients(from: ingredientsData)
    }
    
    static func getElixirs(from value: Any) -> [Elixir] {
        guard let elixirData = value as? [[String: Any]] else { return [] }
        return elixirData.map { Elixir(elixirData: $0) }
    }
}

struct Ingredient: Decodable {
    let id, name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    
    init(ingredientsData: [String: Any]) {
        id = ingredientsData["id"] as? String ?? ""
        name = ingredientsData["name"] as? String ?? ""
    }

    static func getIngredients(from value: Any) -> [Ingredient] {
        guard let ingredientsData = value as? [[String: Any]] else { return [] }
        return ingredientsData.map { Ingredient(ingredientsData: $0) }
    }
}
