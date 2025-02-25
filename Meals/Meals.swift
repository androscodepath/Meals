//
//  Meals.swift
//  Meals
//
//  Created by Andros Slowley on 2/24/25.
//

import Foundation

struct Meals: Codable {
    let meals: [Meal]
    
    static func getMealsFromData(data: Data) -> Meals {
        let decoder = JSONDecoder()
        do {
            let meals = try decoder.decode(Meals.self, from: data)
            return meals
        } catch {
            return Meals(meals: [])
        }
    }
}

struct Meal: Codable {
    let idMeal: String
    let strMeal: String
    let strInstructions: String
    let strMealThumb: String
}
