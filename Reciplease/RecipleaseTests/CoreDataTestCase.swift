//
//  CoreDataTestCase.swift
//  RecipleaseTests
//
//  Created by David Da Silva on 01/02/2022.
//

@testable import Reciplease
import CoreData
import XCTest

class CoreDataTestCase: XCTestCase {
    // MARK: - Private property
    private let fakeRecipe = Recipe(label: "Egg chicken",
                            image: "https://www.fakeurl.com/web-img/f08/f08811025f77fe47088dc50833259abd.jpg",
                            url: "fakeUrl",
                            yield: 6,
                            ingredientLines: ["egg", "chicken"],
//                            ingredients: [Ingredient(text: "fake", image: "fakeImage")],
                            totalTime: 60)
    
    // MARK: - Life cycle
    /// XCTestCase has two methods, setUp() and tearDown(), for setting up your test case before each run and cleaning up any test data afterwards. Since each test gets to start with a clean slate, these methods help make your tests isolated and repeatable.
    override func setUp() {
        RecipeEntity.deleteBy(fakeRecipe.image)
    }
    
    // MARK: - Tests functions
    func testGivenFavoriteAvailable_WhenAddFavorite_ThenFavoriteIsAddedAndExists() {
        RecipeEntity.addRecipeToFavorite(fakeRecipe)
        XCTAssertTrue(RecipeEntity.existBy("https://www.fakeurl.com/web-img/f08/f08811025f77fe47088dc50833259abd.jpg"))
    }
    
    func testGivenFavoriteCreatedAndRemoved_WhenAddFavoriteTestAndDeleteIt_ThenFavoriteTestShouldNotExist() {
        RecipeEntity.addRecipeToFavorite(fakeRecipe)
        XCTAssertTrue(RecipeEntity.existBy("https://www.fakeurl.com/web-img/f08/f08811025f77fe47088dc50833259abd.jpg"))
        RecipeEntity.deleteBy("https://www.fakeurl.com/web-img/f08/f08811025f77fe47088dc50833259abd.jpg")
        XCTAssertFalse(RecipeEntity.existBy("https://www.fakeurl.com/web-img/f08/f08811025f77fe47088dc50833259abd.jpg"))
    }
    
    func testGivenFavorites_WhenDeleteAllAndAddThreeRecipes_ThenFavoritesListReturnThreeWhenCount() {
        RecipeEntity.deleteAll()
        RecipeEntity.addRecipeToFavorite(fakeRecipe)
        RecipeEntity.addRecipeToFavorite(fakeRecipe)
        RecipeEntity.addRecipeToFavorite(fakeRecipe)
        XCTAssertEqual(RecipeEntity.all().count, 3)
    }
    
    func testGivenFavorites_WhenDeleteAll_ThenFavoritesListReturnedIsEmpty() {
        RecipeEntity.deleteAll()
        XCTAssertEqual(RecipeEntity.all().count, 0)
    }
}
