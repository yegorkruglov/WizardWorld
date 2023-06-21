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
}

