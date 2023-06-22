//
//  WizardDetailsVC.swift
//  WizardWorld
//
//  Created by Egor Kruglov on 22.06.2023.
//

import UIKit

final class WizardDetailsVC: UIViewController {
    
    @IBOutlet weak var wizardImageView: UIImageView!
    @IBOutlet weak var wizardInfoLabel: UILabel!
    
    var wizard: Wizard!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = wizard.name
        
        updateWizardImageView()
        updateWizardInfoLabel()
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
    
    private func updateWizardInfoLabel() {
        let dateOfBirthLine: String!
        let patronusLine: String!
        let actorLine: String
        
        if wizard.dateOfBirth == nil || wizard.dateOfBirth == "" {
            dateOfBirthLine = "Unknown"
        } else {
            dateOfBirthLine = wizard.dateOfBirth
        }
        
        if wizard.patronus == nil || wizard.patronus == "" {
            patronusLine = "Unknown"
        } else {
            patronusLine = wizard.patronus ?? "Unknown"
        }
        
        if wizard.actor == nil || wizard.actor == "" {
            actorLine = "Unknown"
        } else {
            actorLine = wizard.actor ?? "Unknown"
        }
        
        wizardInfoLabel.text = """
                        House: \(wizard.house ?? "Unknown")
                        
                        Date of birth: \(dateOfBirthLine ?? "Unknown")
                        
                        Patronus: \(patronusLine ?? "Unknown")
                        
                        Actor: \(actorLine)
                        """
    }
    

   

}
