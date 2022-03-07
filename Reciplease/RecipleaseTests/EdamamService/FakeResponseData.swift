//
//  FakeResponseData.swift
//  RecipleaseTests
//
//  Created by David Da Silva on 01/02/2022.
//

import Foundation
import UIKit

class FakeResponseData {
    // MARK: - Static properties
    static var recipesCorrectData: Data {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "EdamamRecipes", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    
    static var correctImageData: Data {
        let launchscreen_icon = #imageLiteral(resourceName: "LogoApp")
        return launchscreen_icon.pngData()!
    }
    
    static var nilData: Data? = nil
    
}
