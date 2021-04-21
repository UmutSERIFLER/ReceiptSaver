//
//  UIAlertController+Extension.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 19/04/2021.
//

import UIKit

extension UIAlertController {
    
    static func make(_ title: String = "",message: String , _ doneTitle: String = "Approve",_ cancelTitle: String = "Cancel", placeHolder: String = "", completionHandler: @escaping (String?)->()) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: "\(message)", preferredStyle: UIAlertController.Style.alert)
        let createAction = UIAlertAction(title: doneTitle, style: UIAlertAction.Style.default) { (action) -> Void in
            DispatchQueue.main.async {
                completionHandler(alertController.textFields?.first?.text)
            }
        }
        
        alertController.addAction(createAction)
        alertController.addAction(UIAlertAction(title: cancelTitle, style: UIAlertAction.Style.cancel, handler: nil))
        alertController.addTextField(configurationHandler: nil)
        return alertController
    }
    
}
