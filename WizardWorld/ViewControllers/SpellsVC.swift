//
//  SpellsVC.swift
//  WizardWorld
//
//  Created by Egor Kruglov on 21.06.2023.
//

import UIKit

class SpellsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var spells: [Spell]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        title = "SPELLS"
    }

}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension SpellsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        spells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "spellCell", for: indexPath)
        
        var config = cell.defaultContentConfiguration()
        config.text = spells[indexPath.row].name
        config.secondaryText = spells[indexPath.row].description
        cell.contentConfiguration = config
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
