//
//  RecipesFavoritesViewController.swift
//  Reciplease
//
//  Created by David Da Silva on 01/02/2022.
//

import UIKit
import CoreData

class RecipesFavoritesViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var favoritesRecipesTableView: UITableView!
    @IBOutlet weak var noRecipeFavoriteLabel: UILabel!
    
    // MARK: - Pivate properties
    private var recipes = RecipeEntity.all()
    private var selectedRecipe: Recipe?
    private var selectedRecipeImage: UIImage?
    private let segueIdentifier = "segueToRecipeDetail"
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            let recipeDetailVC = segue.destination as! RecipeDetailViewController
            recipeDetailVC.recipe = selectedRecipe
            recipeDetailVC.recipeImage = selectedRecipeImage
        }
    }
    
    // MARK: - Private functions
    private func prepareView() {
        recipes = RecipeEntity.all()
        favoritesRecipesTableView.reloadData()
        if recipes.count > 0 {
            noRecipeFavoriteLabel.isHidden = true
            favoritesRecipesTableView.isHidden = false
        } else {
            noRecipeFavoriteLabel.isHidden = false
            favoritesRecipesTableView.isHidden = true
        }
    }
    
    private func setupTableView() {
        favoritesRecipesTableView.rowHeight = 200
        favoritesRecipesTableView.register(UINib(nibName: "RecipeTableViewCell", bundle: nil),
                                           forCellReuseIdentifier: "RecipeTableViewCellIdentifier")
    }
}

// MARK: - TableView DataSource extension

extension RecipesFavoritesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let recipeCell = tableView.dequeueReusableCell(withIdentifier: "RecipeTableViewCellIdentifier",
                                                             for: indexPath) as? RecipeTableViewCell else {
            return UITableViewCell()
        }
        recipeCell.imageForCell(recipeUrl: (recipes[indexPath.row].image))
        recipeCell.configure(recipe: recipes[indexPath.row])
        
        return recipeCell
    }
}

// MARK: - TableView Delegate extension

extension RecipesFavoritesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRecipe = recipes[indexPath.row]
        selectedRecipeImage = (tableView.cellForRow(at: indexPath) as! RecipeTableViewCell).picture.image
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }
}



