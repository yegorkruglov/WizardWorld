//
//  ElixirDetailsVC.swift
//  WizardWorld
//
//  Created by Egor Kruglov on 22.06.2023.
//

import UIKit

class ElixirDetailsVC: UIViewController {
    
    @IBOutlet weak var elixirInfoLabel: UILabel!
    
    var elixir: Elixir!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = elixir.name
        
        updateElixirInfoLabel()
    }
    
    private func updateElixirInfoLabel() {
        let ingredients = elixir.ingredients.map({ $0.name })
        let ingredientsLine: String!
        
        if ingredients.isEmpty {
            ingredientsLine = "Unknown"
        } else {
            ingredientsLine = ingredients.joined(separator: ", ")
        }
        
        elixirInfoLabel.text = """
                            Effect: \(elixir.effect ?? "Unknown")
                            
                            Side effects: \(elixir.sideEffects ?? "Unknown")
                            
                            Characteristics: \(elixir.characteristics ?? "Unknown")
                            
                            Ingredients: \(ingredientsLine ?? "Unknown")
                            """
    }
    
}
