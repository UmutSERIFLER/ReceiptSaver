//
//  DateFormatter+Extension.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 20/04/2021.
//

import Foundation

extension DateFormatter {
    
    func formattedDate(date: Date) -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }
    
}
