//
//  RecipeTableViewCell.swift
//  Reciplease
//
//  Created by David Da Silva on 30/12/2021.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var allView: UIView!
    @IBOutlet weak var picture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addShadow()
    }
    
    private func addShadow(){
        picture.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7).cgColor
        picture.layer.shadowRadius = 2.0
        picture.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        picture.layer.shadowOpacity = 2.0
    }
    
    func configure(image: String, title: String, subtitle: String, time:String, like: String) {
        picture.image = UIImage(named: image)
        titleLabel.text = title
        subtitleLabel.text = subtitle
        timeLabel.text = time
        likeLabel.text = like
    }
}
