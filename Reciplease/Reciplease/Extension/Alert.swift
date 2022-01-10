//
//  Alert.swift
//  Reciplease
//
//  Created by David Da Silva on 10/01/2022.
//

import UIKit

extension UIViewController {
    func presentAlert(title: String, message: String, buttonTitle: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: buttonTitle, style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
}
