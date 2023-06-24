//
//  StartVC.swift
//  WizardWorld
//
//  Created by Egor Kruglov on 21.06.2023.
//

import UIKit

final class StartVC: UIViewController {
    
    @IBOutlet weak var enterButton: UIButton!
    
    private var wizards: [Wizard]!
    private var spells: [Spell]!
    private var elixirs: [Elixir]!
    private var houses: [House]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        adjustEnterButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        for viewController in viewControllers {
            if let navVC = viewController as? UINavigationController {
                if let housesVC = navVC.topViewController as? HousesVC {
                    housesVC.houses = houses
                } else if let wizardsVC = navVC.topViewController as? WizardsVC {
                    wizardsVC.wizards = wizards
                } else if let spellsVC = navVC.topViewController as? SpellsVC {
                    spellsVC.spells = spells
                } else if let elixirsVC = navVC.topViewController as? ElixirsVC {
                    elixirsVC.elixirs = elixirs
                }
            }
        }
    }
    
    @IBAction func moveToHogwartsButtonTapped() {
        if wizards == nil || spells == nil ||  elixirs == nil || houses == nil {
            let alertController = UIAlertController(
                title: "Network spells are being casted",
                message: "Please wait a few moments or try again later",
                preferredStyle: .alert)
            
            let action = UIAlertAction(title: "EVANESCO!", style: .cancel)
            alertController.addAction(action)
            
            present(alertController, animated: true)
        } else {
            performSegue(withIdentifier: "moveToTabBar", sender: nil)
        }
    }
    
    private func fetchData() {
        let networkManager = NetworkManager.shared
        
        networkManager.fetchWizards(from: Link.wizards.url) { [weak self] result in
            switch result {
            case .success(let wizards):
                print("wizards downloaded")
                self?.wizards = wizards
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        networkManager.fetchSpells(from: Link.spells.url) { [weak self] result in
            switch result {
            case .success(let spells):
                print("spells downloaded")
                self?.spells = spells
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        networkManager.fetchElixirs(from: Link.elixirs.url) { [weak self] result in
            switch result {
            case .success(let elixirs):
                print("elixirs downloaded")
                self?.elixirs = elixirs
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        networkManager.fetchHouses(from: Link.houses.url) { [weak self] result in
            switch result {
            case .success(let houses):
                print("houses downloaded")
                self?.houses = houses
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func adjustEnterButton() {
        enterButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        enterButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        enterButton.layer.shadowOpacity = 1.0
        enterButton.layer.shadowRadius = 10.0
        enterButton.layer.masksToBounds = false
    }
    
}
