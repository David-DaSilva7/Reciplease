//
//  Capitalize.swift
//  Reciplease
//
//  Created by David Da Silva on 31/12/2021.
//

import Foundation

// MARK: - Extension to capitalize the first letter of a word
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
