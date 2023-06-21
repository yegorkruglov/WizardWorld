//
//  StartVC.swift
//  WizardWorld
//
//  Created by Egor Kruglov on 21.06.2023.
//

import UIKit

class StartVC: UIViewController {

    private var wizards: [Wizard]!
    private var spells: [Spell]!
    private var elixirs: [Elixir]!
    private var houses: [House]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        for viewController in viewControllers {
            if let housesVC = viewController as? HousesVC {
                housesVC.houses = houses
            } else if let wizardsVC = viewController as? WizardsVC {
                wizardsVC.wizards = wizards
            } else if let spellsVC = viewController as? SpellsVC {
                spellsVC.spells = spells
            } else if let elixirsVC = viewController as? ElixirsVC {
                elixirsVC.elixirs = elixirs
            }
        }
    }
    
    private func fetchData() {
        let networkManager = NetworkManager.shared
        
        networkManager.fetch([Wizard].self, from: Link.wizards.url) { [weak self] result in
            switch result {
            case .success(let wizards):
                print("wizards downloaded")
                self?.wizards = wizards
            case .failure(let error):
                print(error)
            }
        }
        
        networkManager.fetch([Spell].self, from: Link.spells.url) { [weak self] result in
            switch result {
            case .success(let spells):
                print("spells downloaded")
                self?.spells = spells
            case .failure(let error):
                print(error)
            }
        }
        
        networkManager.fetch([Elixir].self, from: Link.elixirs.url) { [weak self] result in
            switch result {
            case .success(let elixirs):
                print("elixirs downloaded")
                self?.elixirs = elixirs
            case .failure(let error):
                print(error)
            }
        }
        
        networkManager.fetch([House].self, from: Link.houses.url) { [weak self] result in
            switch result {
            case .success(let houses):
                print("houses downloaded")
                self?.houses = houses
            case .failure(let error):
                print(error)
            }
        }
    }

}