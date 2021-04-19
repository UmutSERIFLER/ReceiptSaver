//
//  ReceiptListViewController.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 19/04/2021.
//

import UIKit

class ReceiptListViewController: UIViewController {

    private(set) var tableView: UITableView?
    
    init(_ tableView: UITableView = BaseTableView(cellArray: [UITableViewCell.self])) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        self.tableView = tableView
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewReceipt))
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIComponents()
    }
    
    func setupUIComponents() {
        if let tableView = tableView {
            view.addSubview(tableView)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.frame = view.frame
        }
    }

    @objc func addNewReceipt() {
        print("addNewReceipt")
    }

}

extension ReceiptListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

extension ReceiptListViewController: UITableViewDelegate {
    
}

