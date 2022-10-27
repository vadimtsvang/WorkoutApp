//
//  UIViewController + Extension.swift
//  Workout App
//
//  Created by Vadim on 20.10.2022.
//

import UIKit

extension UIViewController {
    
    func presentAlert(title: String, message: String?) {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
