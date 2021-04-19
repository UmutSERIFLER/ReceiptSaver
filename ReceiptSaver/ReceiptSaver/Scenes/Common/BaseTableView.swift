//
//  BaseTableView.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 19/04/2021.
//

import UIKit

class BaseTableView: UITableView {
    
    init(_ frame: CGRect = .zero,_ style: UITableView.Style = .grouped,cellArray: [UITableViewCell.Type]){
        super.init(frame: frame, style: .grouped)
        tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNormalMagnitude))
        cellArray.forEach { register($0, forCellReuseIdentifier: $0.identifier) }
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}
