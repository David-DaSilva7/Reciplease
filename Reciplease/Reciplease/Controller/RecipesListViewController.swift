//
//  recipeListViewController.swift
//  Reciplease
//
//  Created by David Da Silva on 28/12/2021.
//

import UIKit

class RecipesListViewController: UIViewController {
    
    // MARK: - Properties
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
extension RecipesListViewController: UITableViewDataSource {
    
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
        
        
//        cell.configure(image: "\(String(describing: recipe?.image))", title: "\(String(describing: recipe?.label))", time: "\(Int(recipe!.totalTime))°C" )
        cell.configure(image: "\(recipe?.hits[0].recipe.image)",
                       title: "\(recipe?.hits[0].recipe.label)",
                       subtitle: "\(recipe?.hits[0].recipe.ingredients[0].text)" )
        return cell
    }
}


