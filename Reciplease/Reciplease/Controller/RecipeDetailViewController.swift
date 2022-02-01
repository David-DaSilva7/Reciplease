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
        if buttonFavorite.tintColor == UIColor.white {
            buttonFavorite.tintColor = UIColor(red: 255/255.0, green: 230/255.0, blue: 0/255.0, alpha: 1)
            
        }
        else if  buttonFavorite.tintColor == UIColor(red: 255/255.0, green: 230/255.0, blue: 0/255.0, alpha: 1) {
            buttonFavorite.tintColor = UIColor.white
        }
    }
    
    @IBAction func webLink(_ sender: Any) {
        guard let stringUrl = recipe?.url else { return }
        if let url = NSURL(string: stringUrl) {
            UIApplication.shared.openURL(url as URL)
        }
    }
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    func prepareView() {
        titleLabel.text = recipe?.label
        let labelConfigurationTuple = Utils.getTotalTimeStringSentence(for: recipe!.totalTime)
        timeLabel.text = labelConfigurationTuple.text
        timeLabel.isHidden = labelConfigurationTuple.isHidden
        servingsLabel.text = "\(String(recipe!.yield)) servings"
        picture.image = recipeImage
        configureTextView(recipe!.ingredientLines)
    }
    
    func configureTextView(_ ingredientLines: [String]) {
        listIngredients.text = ""
        for ingredientLine in ingredientLines {
            listIngredients.text! += "- " + ingredientLine.capitalizingFirstLetter() + "\n"
        }
    }
}
