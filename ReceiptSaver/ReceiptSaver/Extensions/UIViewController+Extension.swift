//
//  UIViewController+Extension.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 21/04/2021.
//

import UIKit

extension UIViewController {
    func showAlert(with message: String,header title: String = "Error") {
    DispatchQueue.main.async { [weak self] in
        if !(self?.presentedViewController?.isKind(of: UIAlertController.self) ?? false) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self?.present(alert, animated: true, completion: nil)
        }
    }
  }
}
