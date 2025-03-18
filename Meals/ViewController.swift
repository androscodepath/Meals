//
//  ViewController.swift
//  Meals
//
//  Created by Andros Slowley on 2/24/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mealsTableView: UITableView!
    
    @IBOutlet weak var mealSearchBar: UISearchBar!
    
    let mealsFetcher = MealsFetcher()
    
    var incomingMeals: [Meal] = []
    
    var selectedMeal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mealsTableView.dataSource = self
        mealsTableView.delegate = self
        mealsTableView.register(UINib(nibName: "MealsTableViewCell", bundle: nil), forCellReuseIdentifier: "MealCell")
        
    }
    
    @IBAction func startSearch(_ sender: Any) {
        let searchText = mealSearchBar.text
        guard let nonOptionalSearchText = searchText else {
            return
        }
        
        mealsFetcher.getAllMeals(input: nonOptionalSearchText) { newMeals in
            // Some Other Thread
            DispatchQueue.main.async {
                // Main Thread
                self.incomingMeals = newMeals.meals
                self.mealsTableView.reloadData()
            }
            // Some Other Thread
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return incomingMeals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath) as! MealsTableViewCell
        let row = indexPath.row
        let meal = incomingMeals[row]
        cell.mealLabel.text = meal.strMeal
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMeal = incomingMeals[indexPath.row]
        print("This Meal has been selected: \(selectedMeal!.strMeal)")
        performSegue(withIdentifier: "toMealsDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toMealsDetail" else {
            return
        }
        if let detailViewController = segue.destination as? MealDetailViewController {
            detailViewController.providedMeal = selectedMeal
        }
    }
}
