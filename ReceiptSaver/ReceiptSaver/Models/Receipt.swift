//
//  Receipt.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 19/04/2021.
//

import Foundation
import RealmSwift

struct Receipt: Decodable, RealmCollectionValue {
    var timeStamp: String = ""
    var receiptID: Int = 0
    var totalPrice: Double = 0
    var currency: String = ""
    var receiptName: String = ""
}
