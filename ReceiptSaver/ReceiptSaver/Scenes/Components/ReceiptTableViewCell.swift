//
//  ReceiptTableViewCell.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 20/04/2021.
//

import UIKit

class ReceiptTableViewCell: UITableViewCell {
    
    var receipt: Receipt? {
        didSet {
            receiptNameLabel.text = "Receipt Date: \(receipt?.timeStamp ?? "")"
        }
    }
    
    fileprivate lazy var receiptNameLabel: UILabel = {
        return UILabel.make(textColor: .black, fontSize: 14, alignment: .left)
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        addSubview(receiptNameLabel)
        NSLayoutConstraint.activate([
            receiptNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            receiptNameLabel.heightAnchor.constraint(equalTo: self.heightAnchor),
            receiptNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            receiptNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}
