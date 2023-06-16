//
//  MainCollectionViewController.swift
//  WizardWorld
//
//  Created by Egor Kruglov on 16.06.2023.
//

import UIKit

final class MainCollectionViewController: UICollectionViewController {
    
    private let userActions = UserActions.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Wizard world"
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userActions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userActionCell", for: indexPath) as? UserActionCell else { return UICollectionViewCell() }
        
        cell.userActionLabel.text = userActions[indexPath.item].title
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        switch userAction {
        case .fetchHarry:
            fetchHarry()
        case .fetchAllGryffindors:
            fetchAllGryffindors()
        case .fetchSpells:
            fetchSpells()
        }
    }
    
    // MARK: - Private Methods
    private func showAlert(withStatus status: Alert) {
        let alert = UIAlertController(title: status.title, message: status.message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        DispatchQueue.main.async { [unowned self] in
            present(alert, animated: true)
        }
    }
}

// MARK: - Enums
enum Link {
    case harryPotterURL
    case allGryffindorsURL
    case allSpellsURL
    
    var url: URL {
        switch self {
        case .harryPotterURL:
            return URL(string: "https://hp-api.onrender.com/api/character/9e3f7ce4-b9a7-4244-b709-dae5c1f1d4a8")!
        case .allGryffindorsURL:
            return URL(string: "https://hp-api.onrender.com/api/characters/house/gryffindor")!
        case .allSpellsURL:
            return URL(string: "https://hp-api.onrender.com/api/spells")!
        }
    }
}

enum UserActions: CaseIterable {
    case fetchHarry
    case fetchAllGryffindors
    case fetchSpells
    
    var title: String {
        switch self {
        case .fetchHarry:
            return "Show info about Harry Potter"
        case .fetchAllGryffindors:
            return "List all Gryffindors"
        case .fetchSpells:
            return "List all magic spells"
        }
    }
}

enum Alert {
    case success
    case failed
    
    var title: String {
        switch self {
        case .success:
            return "Success"
        case .failed:
            return "Failed"
        }
    }
    
    var message: String {
        switch self {
        case .success:
            return "You can see the results in the Debug area"
        case .failed:
            return "You can see error in the Debug area"
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}

// MARK: - Networking
extension MainCollectionViewController {
    private func fetchHarry() {
        URLSession.shared.dataTask(with: Link.harryPotterURL.url) { [weak self] data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let wizards = try decoder.decode([Wizard].self, from: data)
                let harry = wizards.first { $0.id == "9e3f7ce4-b9a7-4244-b709-dae5c1f1d4a8" }
                print(harry ?? "No info found")
            } catch {
                print(error.localizedDescription)
                self?.showAlert(withStatus: .failed)
            }
        }.resume()
    }
    
    private func fetchAllGryffindors() {
        URLSession.shared.dataTask(with: Link.allGryffindorsURL.url) { [unowned self] data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let wizards = try decoder.decode([Wizard].self, from: data)
                
                for wizard in wizards {
                    print(wizard.name ?? "")
                }
                print("\n")
                
            } catch {
                print(error)
                self.showAlert(withStatus: .failed)
            }
        }.resume()
    }
    
    private func fetchSpells() {
        URLSession.shared.dataTask(with: Link.allSpellsURL.url) { [unowned self] data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let spells = try decoder.decode([Spell].self, from: data)
                
                for spell in spells {
                    print(spell.name, spell.description, separator: "\n", terminator: "\n\n")
                }
                
            } catch {
                print(error.localizedDescription)
                self.showAlert(withStatus: .failed)
            }
        }.resume()
    }
}
