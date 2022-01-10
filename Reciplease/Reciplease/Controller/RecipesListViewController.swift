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
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // passer le hits en fonction de l'index selectionné
    }
    
    private func setupTableView() {
        tableView.rowHeight = 200
        tableView.register(UINib(nibName: "RecipeTableViewCellIdentifier", bundle: nil),
                                  forCellReuseIdentifier: "RecipeTableViewCellIdentifier")
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeTableViewCellIdentifier",
                                                            for: indexPath) as? RecipeTableViewCell else {
                                                                return UITableViewCell()
        }
        
        guard let hits = hits else {
            return UITableViewCell()
        }

        cell.imageForCell(recipeUrl: (hits[indexPath.row].recipe.image))
        cell.configure(recipe: hits[indexPath.row].recipe)
        
        return cell
    }
}


