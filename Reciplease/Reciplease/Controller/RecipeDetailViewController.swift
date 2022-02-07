//
//  RecipeDetailViewController.swift
//  Reciplease
//
//  Created by David Da Silva on 31/12/2021.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    // MARK: - Properties
    var recipe: Recipe?
    var recipeImage: UIImage?
    
    // MARK: - Outlets
    @IBOutlet weak var listIngredients: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var buttonFavorite: UIBarButtonItem!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var servingsLabel: UILabel!
    @IBOutlet weak var picture: UIImageView!
    
    // MARK: - Actions
    @IBAction func pressedFavorite(_ sender: UIBarButtonItem) {
        if let imageUrl = recipe?.image, let recipe = recipe {
            if RecipeEntity.existBy(imageUrl) {
                RecipeEntity.deleteBy(imageUrl)
                buttonFavorite.tintColor = UIColor.white
            } else {
                RecipeEntity.addRecipeToFavorite(recipe)
                buttonFavorite.tintColor = UIColor(red: 255/255.0, green: 230/255.0, blue: 0/255.0, alpha: 1)
            }
        }
    }
    
    @IBAction func webLink(_ sender: Any) {
        guard let stringUrl = recipe?.url else { return }
        guard let url = URL(string: stringUrl) else { return }
        UIApplication.shared.open(url)
    }
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    func prepareView() {
        favoriteButtonSetup()

        titleLabel.text = recipe?.label
        let labelConfigurationTuple = Utils.getTotalTimeStringSentence(for: recipe!.totalTime)
        timeLabel.text = labelConfigurationTuple.text
        timeLabel.isHidden = labelConfigurationTuple.isHidden
        servingsLabel.text = "\(String(recipe!.yield)) servings"
        picture.image = recipeImage
        configureTextView(recipe!.ingredientLines)
    }
    
    private func favoriteButtonSetup() {
        if let imageUrl = recipe?.image, RecipeEntity.existBy(imageUrl) {
            buttonFavorite.tintColor = UIColor(red: 255/255.0, green: 230/255.0, blue: 0/255.0, alpha: 1)
        } else {
            buttonFavorite.tintColor = UIColor.white
        }
    }
    
    func configureTextView(_ ingredientLines: [String]) {
        listIngredients.text = ""
        for ingredientLine in ingredientLines {
            listIngredients.text! += "- " + ingredientLine.capitalizingFirstLetter() + "\n"
        }
    }
}
