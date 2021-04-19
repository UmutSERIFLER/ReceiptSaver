//
//  NSObject+Extension.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 19/04/2021.
//

import Foundation

extension NSObject {
    
    class var identifier: String {
        return String(describing: self)
    }
}
