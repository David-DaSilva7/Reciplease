//
//  RecipeTableViewCell.swift
//  Reciplease
//
//  Created by David Da Silva on 10/01/2022.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    var recipe: Recipe?
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var picture: UIImageView!
    

    
    // MARK: - Functions
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        addShadow()
//    }
//
//    private func addShadow(){
//        picture.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7).cgColor
//        picture.layer.shadowRadius = 2.0
//        picture.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
//        picture.layer.shadowOpacity = 2.0
//    }
    
    func configure(recipe: Recipe) {
        titleLabel.text = recipe.label
        subtitleLabel.text? = ""
        for ingredient in recipe.ingredientLines {
            subtitleLabel.text? += "\(ingredient), "
        }
        likeLabel.text = "\(String(recipe.yield)) servings"
        let labelConfigurationTuple = Utils.getTotalTimeStringSentence(for: recipe.totalTime)
        timeLabel.text = labelConfigurationTuple.text
        timeLabel.isHidden = labelConfigurationTuple.isHidden
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
    
//    func configure(image: String, title: String, subtitle: String) {
//        picture.image = UIImage(named: image)
//        titleLabel.text = title
//        subtitleLabel.text = subtitle
//        timeLabel.text = time
//        likeLabel.text = like
//    }

    
}
