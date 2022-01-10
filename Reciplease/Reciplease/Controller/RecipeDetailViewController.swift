//
//  RecipeDetailViewController.swift
//  Reciplease
//
//  Created by David Da Silva on 31/12/2021.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    // MARK: - Properties
    private var recipe: Recipes?
    
    // MARK: - Outlets
    @IBOutlet weak var listIngredients: UITextView!
    @IBOutlet weak var buttonFavorite: UIBarButtonItem!
    
    // MARK: - Actions
    @IBAction func pressedFavorite(_ sender: UIBarButtonItem) {
        if buttonFavorite.tintColor == UIColor.white {
            buttonFavorite.tintColor = UIColor(red: 255/255.0, green: 230/255.0, blue: 0/255.0, alpha: 1)
            
        }
        else if  buttonFavorite.tintColor == UIColor(red: 255/255.0, green: 230/255.0, blue: 0/255.0, alpha: 1) {
            buttonFavorite.tintColor = UIColor.white
        }
    }
    
    @IBAction func webLink(_ sender: Any) {
        if let url = NSURL(string: "https://www.apple.com/fr/") {
            UIApplication.shared.openURL(url as URL)
        }
    }
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredients()
        // Do any additional setup after loading the view.
    }
    
    
    
    func ingredients() {
        listIngredients.text = "\(String(describing: recipe?.hits[0].recipe.ingredientLines))"
    }
    
    
}
