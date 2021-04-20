//
//  UILabel+Extension.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 19/04/2021.
//

import UIKit

extension UILabel {
    
    static func make(_ text: String = "", textColor: UIColor = .black, fontSize: CGFloat, alignment: NSTextAlignment = .center, numberOflines: Int = 0) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        label.textAlignment = alignment
        label.numberOfLines = numberOflines
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
}
