//
//  Wizard.swift
//  WizardWorld
//
//  Created by Egor Kruglov on 16.06.2023.
//

struct Wizard: Decodable {
    let id: String
    let name: String
    let dateOfBirth: String?
    let patronus: String?
    let house: String?
    let actor: String?
    let image: String?
}
