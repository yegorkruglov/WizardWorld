//
//  MainTabBarController.swift
//  WizardWorld
//
//  Created by Egor Kruglov on 21.06.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
    }
}
