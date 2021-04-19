//
//  ModelProtocol.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 19/04/2021.
//

import Foundation

protocol ModelProtocol {
    var reloadTableViewClosure: (() -> ()) { get }
    var showAlertClosure: ((String?) -> ()) { get }
    var updateLoadingStatusClosure: ((Bool) -> ()) { get }
}
