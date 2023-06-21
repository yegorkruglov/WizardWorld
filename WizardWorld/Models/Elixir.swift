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
}

struct Ingredient: Decodable {
    let id, name: String
}
