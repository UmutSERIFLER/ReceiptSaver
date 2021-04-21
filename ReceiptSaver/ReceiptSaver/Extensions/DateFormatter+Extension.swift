//
//  DateFormatter+Extension.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 20/04/2021.
//

import Foundation

extension DateFormatter {
    
    func fromDateToString(date: Date) -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }
    
    func fromStringToDate(defaultDate: String?) -> Date? {
        if let selectedDate = defaultDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            if let date = dateFormatter.date(from: selectedDate) {
                return date
            }
        }
        return nil
    }
    
}
