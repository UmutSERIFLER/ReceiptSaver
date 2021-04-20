//
//  Double+Extension.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 20/04/2021.
//

import Foundation

extension Double {
    
    func formattedPrice() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencySymbol = "kr"
        numberFormatter.locale = .init(identifier: "da_DK")
        return numberFormatter.string(from: NSNumber(value: self))!
    }
    
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
