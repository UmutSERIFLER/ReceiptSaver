//
//  UIDatePicker+Extension.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 21/04/2021.
//

import UIKit

extension UIDatePicker {
    
    static func make(_ pickerMode: Mode = .date, defaultDate: String?) -> UIDatePicker {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = pickerMode
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.date = DateFormatter().fromStringToDate(defaultDate: defaultDate) ?? Date()
        return datePicker
    }
}
