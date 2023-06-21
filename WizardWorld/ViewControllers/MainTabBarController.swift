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
        
        fetchData()
    }
    
    private func fetchData() {
        let networkManager = NetworkManager.shared
        
        networkManager.fetch([Wizard].self, from: Link.wizards.url) { result in
            switch result {
            case .success(let wizards):
                print(wizards)
            case .failure(let error):
                print(error)
            }
        }
        
        networkManager.fetch([Spell].self, from: Link.spells.url) { result in
            switch result {
            case .success(let spells):
                print(spells)
            case .failure(let error):
                print(error)
            }
        }
        
        networkManager.fetch([Elixir].self, from: Link.elixirs.url) { result in
            switch result {
            case .success(let elixirs):
                print(elixirs)
            case .failure(let error):
                print(error)
            }
        }
        
        networkManager.fetch([House].self, from: Link.houses.url) { result in
            switch result {
            case .success(let houses):
                print(houses)
            case .failure(let error):
                print(error)
            }
        }
    }
}
