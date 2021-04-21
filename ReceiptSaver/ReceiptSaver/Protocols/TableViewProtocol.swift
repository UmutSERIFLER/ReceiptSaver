//
//  TableViewProtocol.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 19/04/2021.
//

import Foundation

protocol TableViewProtocol {
    func getData(at: IndexPath) -> Any?
    func saveUpdate(with: Any?)
    func retrieveNumberOfItems() -> Int
}
