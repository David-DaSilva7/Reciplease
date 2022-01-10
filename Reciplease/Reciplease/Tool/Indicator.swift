//
//  Indicator.swift
//  Reciplease
//
//  Created by David Da Silva on 10/01/2022.
//

import UIKit

func toogleActivityIndicator(activityIndicator: UIActivityIndicatorView, button: UIButton, showActivityIndicator: Bool){
    activityIndicator.isHidden = !showActivityIndicator
    button.isHidden = showActivityIndicator
}
