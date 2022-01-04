//
//  recipeListViewController.swift
//  Reciplease
//
//  Created by David Da Silva on 28/12/2021.
//

import UIKit

class recipeListViewController: UIViewController {
    
    // MARK: - Properties
    let cellSpacingHeight: CGFloat = 5
    
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
        cell.configure(image: "testPizza", title: "Pizza", subtitle: "Mozzarella and tomato", time: "5 min", like: "2k ❤︎")
        return cell
    }
}


