//
//  ReceiptModel.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 21/04/2021.
//

import Foundation

struct ReceiptModel {
    var id = ""
    var timeStamp = ""
    var receiptImage: NSData?
    var totalPrice: String = ""
    var currency: String = ""
}

extension ReceiptModel {
    func transformToRealmObject() -> Receipt {
        return Receipt(id,timeStamp,receiptImage,totalPrice,currency)
    }
    
    var isObjectSavingEnabled: Bool {
        get {
            return !timeStamp.isEmpty && !totalPrice.isEmpty && !currency.isEmpty
        }
    }
    
    var isObjectLoadable: Bool {
        get {
            return !timeStamp.isEmpty && !totalPrice.isEmpty && !currency.isEmpty && (receiptImage != nil)
        }
    }
}
