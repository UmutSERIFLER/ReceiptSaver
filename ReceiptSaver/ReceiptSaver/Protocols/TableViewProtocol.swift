//
//  TableViewProtocol.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 19/04/2021.
//

import Foundation

protocol TableViewProtocol {
    func getData(at: IndexPath) -> Decodable // This can be defined as Any
    func willDataUpdate(for: IndexPath)
    func retrieveNumberOfItems() -> Int
}
