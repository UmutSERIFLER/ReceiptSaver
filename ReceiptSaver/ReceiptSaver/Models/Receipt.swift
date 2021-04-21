//
//  Receipt.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 19/04/2021.
//

import Foundation
import RealmSwift

@objcMembers class Receipt: Object {
    
    dynamic var timeStamp = ""
    dynamic var receiptImage: NSData?
    dynamic var totalPrice: String = ""
    dynamic var currency: String = ""
    
    convenience init(_ timeStamp: String = "",_ receiptImage: NSData? = nil,_ totalPrice: String = "",_ currency: String = "") {
        self.init()
        self.timeStamp = timeStamp
        self.receiptImage = receiptImage
        self.totalPrice = totalPrice
        self.currency = currency
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

// MARK: - CRUD methods

extension Receipt {
    
    static func all(in realm: Realm = try! Realm()) -> Results<Receipt> {
        return realm.objects(Receipt.self)
            //.sorted(byKeyPath: Receipt.Property.isCompleted.rawValue)
    }
    
    @discardableResult
    static func add(model: Receipt, in realm: Realm = try! Realm())
    -> Receipt {
        try! realm.write {
            realm.add(model)
        }
        return model
    }
    
    func update(timeStamp: String, receiptImage: NSData, totalPrice: String, currency: String, receiptName: String) {
        guard let realm = realm else { return }
        try! realm.write {
            self.timeStamp = timeStamp
            self.receiptImage = receiptImage
            self.totalPrice = totalPrice
            self.currency = currency
        }
    }
    
    func delete() {
        guard let realm = realm else { return }
        try! realm.write {
            realm.delete(self)
        }
    }
}
