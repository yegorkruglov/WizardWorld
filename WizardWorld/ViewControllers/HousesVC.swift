//
//  HousesVC.swift
//  WizardWorld
//
//  Created by Egor Kruglov on 21.06.2023.
//

import UIKit

final class HousesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var houses: [House]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension HousesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        houses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "houseCell", for: indexPath)
        
        var configuration = cell.defaultContentConfiguration()
        configuration.text = houses[indexPath.row].name
        cell.contentConfiguration = configuration
        
        return cell
    }
    
    
}
