//
//  Recipe.swift
//  Reciplease
//
//  Created by David Da Silva on 05/01/2022.
//

import Foundation

struct Recipe: Codable {
    let label: String
    let image: String
    let url: String
    let yield: Int
    let ingredientLines: [String]
    let ingredients: [Ingredient]
    let totalTime: Int
}


