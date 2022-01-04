//
//  SearchViewController.swift
//  Reciplease
//
//  Created by David Da Silva on 23/12/2021.
//

import UIKit

class SearchViewController: UIViewController,  UITextFieldDelegate {
    
    // MARK: - Properties
    var ingredients: [String] = []
    
    // MARK: - Outlets
    @IBOutlet weak var textFieldIngredient: UITextField!
    @IBOutlet weak var listeIngredients: UITextView!
    
    // MARK: - Actions
    @IBAction func clear(_ sender: Any) {
        ingredients.removeAll()
        listeIngredients.text.removeAll()
    }
    
    @IBAction func add(_ sender: Any) {
        if let ingredientsAdd = textFieldIngredient.text, !ingredientsAdd.isEmpty {
            ingredients.append(ingredientsAdd.capitalizingFirstLetter())
            textFieldIngredient.text?.removeAll()
            listeIngredients.text = self.get(self.ingredients)
        }
    }
    
    @IBAction func dismissKeyborad(_ sender: Any) {
        textFieldIngredient.resignFirstResponder()
    }
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func get(_ ingredients: [String]) -> String {
        var ingredientsList = ""
        for (index, ingredient) in self.ingredients.enumerated() {
            if index == 0 {
                ingredientsList += "- \(ingredient)"
            } else {
                ingredientsList += "\n- \(ingredient)"
            }
        }
        
        return ingredientsList
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldIngredient.resignFirstResponder()
        return true
    }
    
}

