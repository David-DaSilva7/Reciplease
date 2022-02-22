//
//  SearchViewController.swift
//  Reciplease
//
//  Created by David Da Silva on 23/12/2021.
//

import UIKit

class SearchViewController: UIViewController,  UITextFieldDelegate {
    
    // MARK: - Properties
    private var ingredients: [String] = []
    private var recipes: Recipes?
    
    // MARK: - Outlets
    @IBOutlet weak var textFieldIngredient: UITextField!
    @IBOutlet weak var listIngredients: UITextView!
    @IBOutlet weak var searchButton: UIButton!
    
    // MARK: - Actions
    
    @IBAction func clear(_ sender: Any) {
        ingredients.removeAll()
        listIngredients.text.removeAll()
        self.searchButton.isEnabled = false
    }
    
    @IBAction func add(_ sender: Any) {
        if let ingredientsAdd = textFieldIngredient.text, !ingredientsAdd.isEmpty {
            ingredients.append(ingredientsAdd.capitalizingFirstLetter())
            textFieldIngredient.text?.removeAll()
            listIngredients.text = self.get(self.ingredients)
            self.searchButton.isEnabled = true
        }
    }
    
    @IBAction func dismissKeyborad(_ sender: Any) {
        textFieldIngredient.resignFirstResponder()
    }
    
    @IBAction func searchRecipes(_ sender: Any) {
        if !ingredients.isEmpty {
            EdamamService.shared.getRecipes(for: self.ingredients, callback: { [weak self]  success, recipes in
                guard let self = self else { return }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    if success, let recipes = recipes {
                        if recipes.count > 0 {
                            self.recipes = recipes
                            self.performSegue(withIdentifier: "showResults", sender: self)
                        } else {
                            self.presentAlert(title: "Aucune recette",
                                              message: "Désolé mais aucune recette n'a été trouvée avec votre liste d'ingrédients.",
                                              buttonTitle: "OK")
                        }
                    } else {
                        self.presentAlert(title: "Petit problème lors de la récupération des recettes",
                                          message: "Veuillez réitérer votre recherche.",
                                          buttonTitle: "OK")
                    }
                }
            })
        }
    }
    
    // MARK: - Functions
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResults" {
            if let recipesListVC = segue.destination as? RecipesListViewController {
                recipesListVC.hits = recipes?.hits
            }
        }
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

