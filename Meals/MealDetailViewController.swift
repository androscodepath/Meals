//
//  MealDetailViewController.swift
//  Meals
//
//  Created by Andros Slowley on 3/12/25.
//

import UIKit

class MealDetailViewController: UIViewController {

    let key = "favoriteMeals"
    let encoder = JSONEncoder()
    @IBOutlet weak var detailMealLabel: UILabel!
    
    @IBAction func saveToFavorite(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        if let data = defaults.data(forKey: key) {
            let decoder = JSONDecoder()
            var meals: [Meal] = (try? decoder.decode([Meal].self, from: data)) ?? []
            
            if let providedMeal {
                meals.append(providedMeal)
            }
            
            
            let newData = try? encoder.encode(meals)
            defaults.setValue(newData, forKey: key)
        } else {
            if let providedMeal {
                let newData = try? encoder.encode([providedMeal])
                defaults.setValue(newData, forKey: key)
            }
        }
        
    }
    var providedMeal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailMealLabel.text = providedMeal?.strMeal

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
