//
//  Recipes.swift
//  Reciplease
//
//  Created by David Da Silva on 04/01/2022.
//

import Foundation

struct Recipes: Codable {
    let q: String
    let from, to: Int
    let more: Bool
    let count: Int
    let hits: [Hit]
}

struct Hit: Codable {
    let recipe: Recipe
    let bookmarked, bought: Bool
}

struct Recipe: Codable {
    let label: String
    let image: String
    let url: String
    let yield: Int
    let ingredientLines: [String]
    let ingredients: [Ingredient]
    let totalTime: Int
}

struct Ingredient: Codable {
    let text: String
    let weight: Double
    let image: String?
}
