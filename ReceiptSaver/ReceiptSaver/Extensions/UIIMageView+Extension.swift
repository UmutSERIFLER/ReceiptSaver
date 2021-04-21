//
//  UIIMageView+Extension.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 21/04/2021.
//

import UIKit

extension UIImageView {
    
    static func make(_ image: UIImage? = nil, contentMode: ContentMode = .scaleAspectFit) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = contentMode
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
}
