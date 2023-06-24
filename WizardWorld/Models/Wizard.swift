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
    
    init(wizardData: [String: Any]) {
        id = wizardData["id"] as? String ?? ""
        name = wizardData["name"] as? String ?? ""
        dateOfBirth = wizardData["dateOfBirth"] as? String ?? "Unknown"
        patronus = wizardData["patronus"] as? String ?? "Unknown"
        house = wizardData["house"] as? String ?? "Unknown"
        actor = wizardData["actor"] as? String ?? "Unknown"
        image = wizardData["image"] as? String ?? "Unknown"
    }
    
    static func getWizards(from value: Any) -> [Wizard] {
        guard let wizardsData = value as? [[String: Any]] else { return [] }
        return wizardsData.map { Wizard(wizardData: $0) }
    }
}
