//
//  MealsFetcher.swift
//  Meals
//
//  Created by Andros Slowley on 2/24/25.
//

import Foundation

class MealsFetcher {
    func createURLForFood(food: String) -> URL? {
        var url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php")
        let param = URLQueryItem(name: "s", value: food)
        url?.append(queryItems: [param])
        return url
    }
    
    // 1. Create a function to perform search based on input text
    
    func getAllMeals(input: String, completion: @escaping (Meals) -> Void) {
        // (2) Create URL Session
        let session = URLSession.shared
        
        // (3) Create URL
        guard let url = createURLForFood(food: input) else { return }
        
        // (4) Create URLRequest
        let request = URLRequest(url: url)
        
        // (5) Use Request to create data Task
        session.dataTask(with: request) { data, response, error in
            // (6) JSON Data is returned
            if let data = data {
                let meals = Meals.getMealsFromData(data: data)
                completion(meals)
            }
        }.resume()
        
        
    }
    
}
