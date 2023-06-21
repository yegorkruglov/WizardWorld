//
//  MainTabBarController.swift
//  WizardWorld
//
//  Created by Egor Kruglov on 21.06.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let networkManager = NetworkManager.shared
        
//        networkManager.fetch([Wizard].self, from: Link.wizards.url) { result in
//            switch result {
//            case .success(let wizards):
//                print(wizards)
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        networkManager.fetch([Spell].self, from: Link.wizards.url) { result in
            switch result {
            case .success(let spells):
                print(spells)
            case .failure(let error):
                print(error)
            }
        }
    }
    

}
