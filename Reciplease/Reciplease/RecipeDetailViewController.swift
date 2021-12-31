//
//  RecipeDetailViewController.swift
//  Reciplease
//
//  Created by David Da Silva on 31/12/2021.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    @IBOutlet weak var listIngredients: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredients()
        // Do any additional setup after loading the view.
    }
    
    func ingredients() {
        listIngredients.text = "- Salad \n- Tomatp \n- Egg"
    }
    
}
