//
//  RecipeEntity.swift
//  Reciplease
//
//  Created by David Da Silva on 14/01/2022.
//

import CoreData
@objc(Reminder)

class RecipeEntity: NSManagedObject {
    
    // Retrieve all recipes stored in Core Data
    static func all() -> [Recipe] {
        let request: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        guard let favoriteRecipes = try? CoreDataStack.sharedInstance.viewContext.fetch(request) else {
            return []
        }
        var recipes = [Recipe]()
        for favorite in favoriteRecipes {
            if let name = favorite.name,
               let image = favorite.image_url,
               let url = favorite.original_url,
               let ingredientLines = favorite.ingredient_lines {
                let recipe = Recipe(label: name,
                                    image: image,
                                    url: url,
                                    yield: Int(favorite.yield),
                                    ingredientLines: (ingredientLines.split(separator: ",").map {
                    String($0)
                }),
                                    totalTime: Int(favorite.preparation_time))
                recipes.append(recipe)
            }
        }
        return recipes
    }
    
    // Save recipe in Core Data
    static func addRecipeToFavorite(_ recipe: Recipe) {
        let favoriteRecipe = RecipeEntity(context: CoreDataStack.sharedInstance.viewContext)
        favoriteRecipe.name = recipe.label
        favoriteRecipe.preparation_time = Int16(recipe.totalTime)
        favoriteRecipe.yield = Int16(recipe.yield)
        favoriteRecipe.original_url = recipe.url
        favoriteRecipe.image_url = recipe.image
        favoriteRecipe.ingredient_lines = recipe.ingredientLines.joined(separator: ",")
        saveContext()
    }
    
    // Check if data already exists in Core Data comparing url
    static func existBy(_ url: String) -> Bool {
        let request: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        request.predicate = NSPredicate(format: "image_url == %@", url)
        guard let count = try? CoreDataStack.sharedInstance.viewContext.count(for: request) else {
            return false
        }
        return count > 0
    }
    
    // Delete RecipeEntity in Core Data. Use url in parameters to call the right data
    static func deleteBy(_ url: String) {
        let request: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        request.predicate = NSPredicate(format: "image_url == %@", url)
        if let favoriteRecipes = try? CoreDataStack.sharedInstance.viewContext.fetch(request) {
            for recipe in favoriteRecipes {
                CoreDataStack.sharedInstance.viewContext.delete(recipe)
            }
        }
        saveContext()
    }
    
    // Delete all entities. Use url in parameters to call the right data
    static func deleteAll() {
        let request: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        request.predicate = NSPredicate(value: true)
        if let favoriteRecipes = try? CoreDataStack.sharedInstance.viewContext.fetch(request) {
            for recipe in favoriteRecipes {
                CoreDataStack.sharedInstance.viewContext.delete(recipe)
            }
        }
        saveContext()
    }
    
    static func saveContext() {
        try? CoreDataStack.sharedInstance.viewContext.save()
    }
}
