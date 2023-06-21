//
//  WizardDetailsVC.swift
//  WizardWorld
//
//  Created by Egor Kruglov on 22.06.2023.
//

import UIKit

class WizardDetailsVC: UIViewController {
    
    @IBOutlet weak var wizardImageView: UIImageView!
    @IBOutlet weak var wizardInfoLabel: UILabel!
    
    var wizard: Wizard!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = wizard.name
        updateWizardImageView()
        wizardInfoLabel.text = """
                        House: \(wizard.house ?? "Unknown")
                        Date of birth: \(wizard.dateOfBirth ?? "Unknown")
                        Patronus: \(wizard.patronus ?? "Unknown")
                        Actor: \(wizard.actor ?? "Unknown")
                        """
    }
    
    private func updateWizardImageView() {
        if wizard.image == nil || wizard.image == "" {
            wizardImageView.image = UIImage(systemName: "person")
        } else {
            let imageURL = wizard.image!
            let networkManager = NetworkManager.shared
            networkManager.fetchImage(from: URL(string: imageURL)!) { [weak self] result in
                switch result {
                case .success(let imageData):
                    self?.wizardImageView.image = UIImage(data: imageData)
                case .failure(let error):
                    print(error)
                }
            }
        }
        
    }
    

   

}
