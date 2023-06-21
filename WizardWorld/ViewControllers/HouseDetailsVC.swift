//
//  HouseDetailsVC.swift
//  WizardWorld
//
//  Created by Egor Kruglov on 21.06.2023.
//

import UIKit

class HouseDetailsVC: UIViewController {
    
    @IBOutlet weak var houseImageView: UIImageView!
    @IBOutlet weak var houseInfoLabel: UILabel!
    
    var house: House!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = house.name
        
        houseImageView.image = UIImage(named: house.name)
        houseInfoLabel.text = """
                        House founder: \(house.founder)
                        Colors: \(house.houseColours)
                        Animal: \(house.animal)
                        Element: \(house.element)
                        Ghost: \(house.ghost)
                        Common Room: \(house.commonRoom)
                        """

        
    }
    

    

}
