//
//  ReceiptModel.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 19/04/2021.
//

import Foundation
import Realm
import RealmSwift

class ReceiptModel: Object {
    @objc dynamic var createdAt: NSDate = NSDate()
    @objc dynamic var receiptID: Int = 0
    @objc dynamic var totalPrice: Double = 0
    @objc dynamic var currency: String = ""
    @objc dynamic var receiptName: String = ""
    let ofPost = LinkingObjects(fromType: ReceiptList.self, property: "receipts")
    
    
    convenience init(_ createdAt: NSDate,_ receiptID: Int, _ totalPrice: Double, _ currency: String, _ receiptName: String) {
        self.init()
        self.createdAt = createdAt
        self.receiptID = receiptID
        self.totalPrice = totalPrice
        self.currency = currency
        self.receiptName = receiptName
    }
}
