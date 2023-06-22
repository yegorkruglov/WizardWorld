//
//  ElixirsVC.swift
//  WizardWorld
//
//  Created by Egor Kruglov on 21.06.2023.
//

import UIKit

class ElixirsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var elixirs: [Elixir]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        title = "ELIXIRS"
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        guard let elixirDetailsVC = segue.destination as? ElixirDetailsVC else { return }
        
        elixirDetailsVC.elixir = elixirs[indexPath.row]
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ElixirsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        elixirs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "elixirCell", for: indexPath)
        
        var config = cell.defaultContentConfiguration()
        config.text = elixirs[indexPath.row].name
        cell.contentConfiguration = config
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
