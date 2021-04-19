//
//  ReceiptListViewModel.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 19/04/2021.
//

import Foundation

class ReceiptListViewModel: ViewModelProtocol {
 
    
    var reloadTableViewClosure: (() -> ()) = {}
    var showAlertClosure: ((String?) -> ()) = {_ in}
    var updateLoadingStatusClosure: ((Bool) -> ()) = {_ in}
    
    
    

    func getData(at: IndexPath) -> Decodable {
        return Receipt()
    }
    
    func willDataUpdate(for: IndexPath) {
        
    }
    
    func retrieveNumberOfItems() -> Int {
        return 0
    }
  
    
   
}
