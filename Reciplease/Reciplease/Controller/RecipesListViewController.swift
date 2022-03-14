//
//  recipeListViewController.swift
//  Reciplease
//
//  Created by David Da Silva on 28/12/2021.
//

import UIKit

class RecipesListViewController: UIViewController {
    
    // MARK: - Properties
    private var selectedRecipe: Recipe?
    private var selectedRecipeImage: UIImage?
    var hits: [Hit] = []
    private let segueIdentifier = "segueToRecipeDetail"
    
    // MARK: - Outlets
    @IBOutlet weak var recipesTableView: UITableView!
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            let recipeDetailVC = segue.destination as! RecipeDetailViewController
            recipeDetailVC.recipe = selectedRecipe
            recipeDetailVC.recipeImage = selectedRecipeImage
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.recipesTableView.reloadData()
    }
    
    private func setupTableView() {
        self.recipesTableView.rowHeight = 200
        self.recipesTableView.register(UINib(nibName: "RecipeTableViewCell", bundle: nil),
                                       forCellReuseIdentifier: "RecipeTableViewCellIdentifier")
    }
}

// MARK: - TableView DataSource extension
extension RecipesListViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Number of sections
    func numberOfSections(in tableView : UITableView) -> Int {
        return 1
    }
    
    // Cell numbers
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hits.count
    }
    
    // Content in the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeTableViewCellIdentifier",
                                                       for: indexPath) as? RecipeTableViewCell else {
            return UITableViewCell()
        }
        
        cell.imageForCell(recipeUrl: (hits[indexPath.row].recipe.image))
        cell.configure(recipe: hits[indexPath.row].recipe)
        
        return cell
    }
    // MARK: - TableView Delegate extension
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRecipe = hits[indexPath.row].recipe
        selectedRecipeImage = (tableView.cellForRow(at: indexPath) as! RecipeTableViewCell).picture.image
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }
}




