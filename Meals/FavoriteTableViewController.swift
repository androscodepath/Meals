//
//  FavoriteTableViewController.swift
//  Meals
//
//  Created by Andros Slowley on 3/19/25.
//

import UIKit

class FavoriteTableViewController: UITableViewController {
    let key = "favoriteMeals"
    var favorites: [Meal] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MealsTableViewCell", bundle: nil), forCellReuseIdentifier: "MealCell")

        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: key) {
            let decoder = JSONDecoder()
            if let savedFavorites = try? decoder.decode([Meal].self, from: data) {
                self.favorites = savedFavorites
                tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favorites.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell") as! MealsTableViewCell
     
    let favorite = favorites[indexPath.row]
        
     cell.mealLabel.text = favorite.strMeal
        
    return cell
    }

}
