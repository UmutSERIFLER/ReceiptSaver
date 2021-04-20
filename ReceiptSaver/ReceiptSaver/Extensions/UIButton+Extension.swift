//
//  UIButton+Extension.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 19/04/2021.
//

import UIKit

extension UIButton {
    
    static func make(_ image: UIImage? = nil, _ titleColor: UIColor = .black, _ title: String? = nil,_ rect: CGRect = CGRect(origin: .zero, size: CGSize(width: 25, height: 25)),_ textAlignment: ContentHorizontalAlignment = .left) -> UIButton {
        let button = UIButton(frame: rect)
        button.tintColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.contentHorizontalAlignment = textAlignment
        button.setTitleColor(titleColor, for: .normal)
        button.setImage(image, for: .normal)
        return button
    }
    
}
