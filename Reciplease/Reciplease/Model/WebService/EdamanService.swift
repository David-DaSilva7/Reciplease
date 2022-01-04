//
//  Recipes.swift
//  Reciplease
//
//  Created by David Da Silva on 03/01/2022.
//

//import Foundation
//import UIKit
//import Alamofire
//
//class EdamanService {
//    
//    // MARK: - Properties
//    static let shared = EdamanService()
//    private init() {}
//    private var task: URLSessionDataTask?
//    
//    private var edamanSession = URLSession(configuration: .default)
//    init(edamanSession: URLSession) {
//        self.edamanSession = edamanSession
//    }
//    
//    // MARK: - Function
//    func getRecipes(for ingredients: [String], callback: @escaping (Bool, Recipes?) -> Void) {
//        let ingredientsParameter = ["app_key": APIKey.EdamamRecipeSearchAppKey,
//                                    "app_id": APIKey.EdamamRecipeSearchAppID,
//                                    "q": ingredients.joined(separator: ",")]
//        
//        AF.request(Edaman.endpoint, method: .get, parameters: ingredientsParameter)
//            .validate(contentType: ["application/json"])
//            .responseJSON { response in
//                guard let data = response.data else {
//                    return
//                }
//                do {
//                    let decoder = JSONDecoder()
//                    let recipes = try decoder.decode(Recipes.self, from: data)
//                    callback(true, recipes)
//                } catch {
//                    callback(false, nil)
//                }
//            }
//    }
//    
//    func getImage(url: String, callback: @escaping ((UIImage?) -> Void)) {
//        AF.download(url).responseData { response in
//            if let data = response.value {
//                let image = UIImage(data: data)
//                callback(image)
//            }
//        }
//    }
//    
//}
