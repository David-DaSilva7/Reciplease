//
//  recipeListViewController.swift
//  Reciplease
//
//  Created by David Da Silva on 28/12/2021.
//

import UIKit

class recipeListViewController: UIViewController {
    
    // MARK: - Properties
    private var recipe: Recipe?
    private var recipeImage: UIImage?
    var hits: [Hit]?
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}

// MARK: - Extensions
extension recipeListViewController: UITableViewDataSource {
    
    //        Nombres de sections
    func numberOfSections(in tableView : UITableView) -> Int {
        return 1
    }
    
    //        Nombres de cellules
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    //    Contenu dans la cellule
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell") as? RecipeTableViewCell else {
            return UITableViewCell()
        }
        
        guard let hits = hits else {
            return UITableViewCell()
        }
        
        cell.imageForCell(recipeUrl: (hits[indexPath.row].recipe.image))
        cell.configure(recipe: hits[indexPath.row].recipe)
//        cell.configure(image: "\(recipe?.image)", title: "\(recipe?.label)")
        return cell
    }
}


