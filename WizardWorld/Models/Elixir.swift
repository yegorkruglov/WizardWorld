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
    
    init(id: String, name: String, effect: String?, sideEffects: String?, characteristics: String?, ingredients: [Ingredient]) {
        self.id = id
        self.name = name
        self.effect = effect
        self.sideEffects = sideEffects
        self.characteristics = characteristics
        self.ingredients = ingredients
    }
    
    init(elixirData: [String: Any]) {
        id = elixirData["id"] as? String ?? ""
        name = elixirData["name"] as? String ?? ""
        effect = elixirData["effect"] as? String ?? ""
        sideEffects = elixirData["sideEffects"] as? String ?? ""
        characteristics = elixirData["characteristics"] as? String ?? ""
        ingredients = elixirData["ingredients"] as? [Ingredient] ?? []
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
    
    init(ingredientData: [String: Any]) {
        id = ingredientData["id"] as? String ?? ""
        name = ingredientData["name"] as? String ?? ""
    }
    
    static func getIngredients(from value: Any) -> [Ingredient] {
        guard let ingredientData = value as? [[String: Any]] else { return [] }
        return ingredientData.map { Ingredient(ingredientData: $0) }
    }
}
