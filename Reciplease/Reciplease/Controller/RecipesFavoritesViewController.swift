//
//  RecipesFavoritesViewController.swift
//  Reciplease
//
//  Created by David Da Silva on 01/02/2022.
//

import UIKit

class RecipesFavoritesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
    
    // MARK: - TableView DataSource extension
    extension RecipesFavoritesViewController: UITableViewDataSource, UITableViewDelegate {
        
        //        Nombres de sections
        func numberOfSections(in tableView : UITableView) -> Int {
            return 1
        }
        
        //        Nombres de cellules
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return hits?.count ?? 0
        }
        
        //    Contenu dans la cellule
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeTableViewCellIdentifier",
                                                                for: indexPath) as? RecipeTableViewCell else {
                                                                    return UITableViewCell()
            }


            cell.imageForCell(recipeUrl: (recipes[indexPath.row].recipe.image))
            cell.configure(recipe: recipes[indexPath.row].recipe)
            
            return cell
        }
        // MARK: - TableView Delegate extension
        // Lorsqu'on appui sur une cellule
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            selectedRecipe = hits?[indexPath.row].recipe
            selectedRecipeImage = (tableView.cellForRow(at: indexPath) as! RecipeTableViewCell).picture.image
            performSegue(withIdentifier: segueIdentifier, sender: self)
        }
    }


