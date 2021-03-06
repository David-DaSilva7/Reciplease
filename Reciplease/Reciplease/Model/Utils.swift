//
//  Utils.swift
//  Reciplease
//
//  Created by David Da Silva on 05/01/2022.
//

import UIKit

class Utils {
    // MARK: - Internal functions
    static func minutesToHoursMinutes (minutes : Int) -> (hours : Int , leftMinutes : Int) {
        return (minutes / 60, (minutes % 60))
    }
    
    static func getTotalTimeStringSentence(for totalTime: Int) -> (text: String, isHidden: Bool) {
        let totalTime = minutesToHoursMinutes(minutes: totalTime)
        if totalTime.hours == 0 && totalTime.leftMinutes == 0 {
            return ("", true)
        } else {
            if totalTime.hours == 0 {
                return ("\(totalTime.leftMinutes) minutes", false)
            } else if totalTime.leftMinutes == 0 {
                return ("\(totalTime.hours) hour", false)
            } else {
                return ("\(totalTime.hours)h\(totalTime.leftMinutes)", false)
            }
        }
    }
    
}
