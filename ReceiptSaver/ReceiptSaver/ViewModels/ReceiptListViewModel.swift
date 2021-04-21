//
//  ReceiptListViewModel.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 19/04/2021.
//

import Foundation
import RealmSwift

class ReceiptListViewModel: ViewModelProtocol {
    
    var reloadTableViewClosure: (() -> ()) = {}
    var showAlertClosure: ((String?) -> ()) = {_ in}
    var updateLoadingStatusClosure: (([Int], [Int], [Int]) -> ()) = {_,_,_  in}
    
    private var receipts: Results<Receipt>? {
        didSet {
            self.reloadTableViewClosure()
        }
    }
    private var receiptToken: NotificationToken?
    
    init() {
        receipts = Receipt.all()
        receiptToken = receipts?.observe({ [weak self] (changes) in
            switch changes {
            case .initial:
                self?.reloadTableViewClosure()
            case .update(_, let deletions, let insertions, let updates):
                self?.updateLoadingStatusClosure(deletions, insertions, updates)
            case .error(let error):
                self?.showAlertClosure(error.localizedDescription)
            }
        })
    }
    
    
    func getData(at: IndexPath) -> Any? {
        return self.receipts?[at.row]
    }
    
    func saveUpdate(with data: Any?) {
        if let receipt = data as? Receipt {
            Receipt.add(model: receipt)
        }
    }
    
    func retrieveNumberOfItems() -> Int {
        return receipts?.count ?? 0//return self.realmDBManager.objects().count
    }
    
    
    
}
