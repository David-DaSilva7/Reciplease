//
//  Recipes.swift
//  Reciplease
//
//  Created by David Da Silva on 04/01/2022.
//

import Foundation

// MARK: - Structure
struct Recipes: Codable {
    let q: String
    let from, to: Int
    let more: Bool
    let count: Int
    let hits: [Hit]
}
