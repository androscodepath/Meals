//
//  ViewController.swift
//  Meals
//
//  Created by Andros Slowley on 2/24/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mealSearchBar: UISearchBar!
    
    let mealsFetcher = MealsFetcher()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startSearch(_ sender: Any) {
        let searchText = mealSearchBar.text
        
        guard let nonOptionalSearchText = searchText else {
            return
        }
        
        mealsFetcher.getAllMeals(input: nonOptionalSearchText) { meals in
            
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

