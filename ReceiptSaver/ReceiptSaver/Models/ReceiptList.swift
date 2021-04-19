//
//  ReceiptList.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 19/04/2021.
//

import Foundation
import Realm
import RealmSwift

class ReceiptList: Object {
    @objc dynamic var listID: Int = 0
    var receipts = List<ReceiptModel>()
    
    override class func primaryKey() -> String? {
        return #keyPath(listID)
    }
    
    convenience init(_ listID: Int,_ receipts: [ReceiptModel]) {
        self.init()
        self.listID = listID
        self.receipts.append(objectsIn: receipts)
    }
}

extension ReceiptList {
//    func convertToSwiftObject() -> CoyoCommentsResponseModel {
//        var commentsObject : CoyoCommentsResponseModel = []
//        self.comments.forEach { (commentRM) in
//            let commentModel = CoyoCommentResponseModel(postId: self.postId, id: commentRM.id, name: commentRM.name, email: commentRM.email, body: commentRM.body)
//            commentsObject.append(commentModel)
//        }
//        return commentsObject
//    }
}
