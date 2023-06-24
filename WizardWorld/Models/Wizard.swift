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
    
    init(id: String, name: String, dateOfBirth: String?, patronus: String?, house: String?, actor: String?, image: String?) {
        self.id = id
        self.name = name
        self.dateOfBirth = dateOfBirth
        self.patronus = patronus
        self.house = house
        self.actor = actor
        self.image = image
    }
    
    init(wizardData: [String: Any]) {
        id = wizardData["id"] as? String ?? ""
        name = wizardData["name"] as? String ?? ""
        dateOfBirth = wizardData["dateOfBirth"] as? String ?? ""
        patronus = wizardData["patronus"] as? String ?? ""
        house = wizardData["house"] as? String ?? ""
        actor = wizardData["actor"] as? String ?? ""
        image = wizardData["image"] as? String ?? ""
    }
    
    static func getWizards(from value: Any) -> [Wizard] {
        guard let wizardsData = value as? [[String: Any]] else { return [] }
        return wizardsData.map { Wizard(wizardData: $0) }
    }
}
