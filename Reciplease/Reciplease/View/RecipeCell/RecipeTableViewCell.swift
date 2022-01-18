//
//  RecipeTableViewCell.swift
//  Reciplease
//
//  Created by David Da Silva on 10/01/2022.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    
    // MARK: - Property
    var recipe: Recipe?
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var picture: UIImageView!
    
    // MARK: - Functions    
    func configure(recipe: Recipe) {
        self.titleLabel.text = recipe.label
        self.subtitleLabel.text? = ""
        for ingredient in recipe.ingredientLines {
            self.subtitleLabel.text? += "\(ingredient), "
        }
        self.likeLabel.text = "\(String(recipe.yield)) servings"
        let labelConfigurationTuple = Utils.getTotalTimeStringSentence(for: recipe.totalTime)
        self.timeLabel.text = labelConfigurationTuple.text
        self.timeLabel.isHidden = labelConfigurationTuple.isHidden
    }
    
    func imageForCell(recipeUrl: String) {
        EdamamService.shared.getImage(url: recipeUrl, callback: { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if let image = image {
                    self.picture.image = image
                }
            }
        })
    }
}
