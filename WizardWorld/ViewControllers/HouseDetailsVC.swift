//
//  HouseDetailsVC.swift
//  WizardWorld
//
//  Created by Egor Kruglov on 21.06.2023.
//

import UIKit

class HouseDetailsVC: UIViewController {
    
    @IBOutlet weak var houseImageView: UIImageView!
    @IBOutlet weak var houseNameLabel: UILabel!
    @IBOutlet weak var houseInfoLabel: UILabel!
    
    var house: House!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        houseImageView.image = UIImage(named: house.name)
        houseNameLabel.text = house.name.uppercased()
        houseInfoLabel.text = """
                        House founder: \(house.founder)
                        Founder: \(house.founder)
                        Colors: \(house.houseColours.lowercased())
                        Animal: \(house.animal)
                        Element: \(house.element)
                        Ghost: \(house.ghost)
                        Common Room: \(house.commonRoom)
                        """

        
    }
    

    

}
