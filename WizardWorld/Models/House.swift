//
//  House.swift
//  WizardWorld
//
//  Created by Egor Kruglov on 21.06.2023.
//

import Foundation

struct House: Decodable {
    let id, name, houseColours, founder: String
    let animal, element, ghost, commonRoom: String
    
    init(houseData: [String: Any]) {
        id = houseData["id"] as? String ?? ""
        name = houseData["name"] as? String ?? ""
        houseColours = houseData["houseColours"] as? String ?? ""
        founder = houseData["founder"] as? String ?? ""
        animal = houseData["animal"] as? String ?? ""
        element = houseData["element"] as? String ?? ""
        ghost = houseData["ghost"] as? String ?? ""
        commonRoom = houseData["commonRoom"] as? String ?? ""
    }
    
    static func getHouses(from value: Any) -> [House] {
        guard let houseData = value as? [[String: Any]] else { return [] }
        return houseData.map { House(houseData: $0) }
    }
}

