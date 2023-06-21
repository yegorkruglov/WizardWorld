//
//  WizardsVC.swift
//  WizardWorld
//
//  Created by Egor Kruglov on 21.06.2023.
//

import UIKit

class WizardsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var houseSelector: UISegmentedControl!
    
    var wizards: [Wizard]!
    private var filteredWizards: [Wizard]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }
     
    
    @IBAction func houseSelectorTapped() {
        tableView.reloadData()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        guard let wizardDetailsVC = segue.destination as? WizardDetailsVC else { return }
        
        wizardDetailsVC.wizard = filteredWizards[indexPath.row]
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension WizardsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let selectedHouse = houseSelector.selectedSegmentIndex
        
        switch selectedHouse {
        case 0:
            filteredWizards = wizards.filter { $0.house == "Gryffindor"}
        case 1:
            filteredWizards = wizards.filter { $0.house == "Ravenclaw"}
        case 2:
            filteredWizards = wizards.filter { $0.house == "Hufflepuff"}
        default:
            filteredWizards = wizards.filter { $0.house == "Slytherin"}
        }
        
        return filteredWizards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wizardCell", for: indexPath)
        
        var configuration = cell.defaultContentConfiguration()
        configuration.text = filteredWizards[indexPath.row].name
        cell.contentConfiguration = configuration
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
