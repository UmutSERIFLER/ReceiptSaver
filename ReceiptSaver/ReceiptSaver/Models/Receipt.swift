//
//  Receipt.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 19/04/2021.
//

import Foundation
import RealmSwift

@objcMembers class Receipt: Object {
    
    dynamic var id: String = ""
    
    dynamic var timeStamp: String = ""
    dynamic var receiptImage: NSData?
    dynamic var totalPrice: String = ""
    dynamic var currency: String = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(_ id: String,_ timeStamp: String = "",_ receiptImage: NSData? = nil,_ totalPrice: String = "",_ currency: String = "") {
        self.init()
        self.id = id
        self.timeStamp = timeStamp
        self.receiptImage = receiptImage
        self.totalPrice = totalPrice
        self.currency = currency
    }
}

extension Receipt {
    func tranformsToReceiptModel() -> ReceiptModel {
        return ReceiptModel(id: self.id, timeStamp: self.timeStamp, receiptImage: self.receiptImage, totalPrice: self.totalPrice, currency: self.currency)
    }
}

// MARK: - CRUD methods

extension Receipt {
    
    static func all(in realm: Realm = try! Realm()) -> Results<Receipt> {
        return realm.objects(Receipt.self)
    }
    
    @discardableResult
    static func add(model: Receipt, in realm: Realm = try! Realm())
    -> Receipt {
        try! realm.write {
            realm.add(model)
        }
        return model
    }
    
    static func saveUpdate(model: Receipt, in realm: Realm = try! Realm()) {
        guard !model.id.isEmpty else {
            model.id = UUID().uuidString
            self.add(model: model)
            return
        }
        guard let receipt = realm.objects(Receipt.self).filter(NSPredicate(format: "id == %@", model.id)).first else {
            return
        }
        try! realm.write {
            receipt.timeStamp = model.timeStamp
            receipt.receiptImage = model.receiptImage
            receipt.totalPrice = model.totalPrice
            receipt.currency = model.currency
        }
    }
    
    func delete() {
        guard let realm = realm else { return }
        try! realm.write {
            realm.delete(self)
        }
    }
}
