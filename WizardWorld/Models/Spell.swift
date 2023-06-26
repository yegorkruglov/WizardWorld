//
//  Spell.swift
//  WizardWorld
//
//  Created by Egor Kruglov on 16.06.2023.
//

struct Spell {
    let id: String
    let name: String
    let description: String
    
    init(spellData: [String: Any]) {
        id = spellData["id"] as? String ?? ""
        name = spellData["name"] as? String ?? ""
        description = spellData["description"] as? String ?? ""
    }
    
    static func getSpells(from value: Any) -> [Spell] {
        guard let spellData = value as? [[String: Any]] else { return [] }
        return spellData.map { Spell(spellData: $0) }
    }
}
