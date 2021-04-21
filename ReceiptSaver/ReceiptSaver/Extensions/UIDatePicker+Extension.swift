//
//  UIDatePicker+Extension.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 21/04/2021.
//

import UIKit

extension UIDatePicker {
    static func make(_ pickerMode: Mode = .date) -> UIDatePicker {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = pickerMode
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }
}
