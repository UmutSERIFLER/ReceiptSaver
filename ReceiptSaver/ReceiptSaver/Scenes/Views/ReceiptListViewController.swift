//
//  ReceiptListViewController.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 19/04/2021.
//

import UIKit

class ReceiptListViewController: UIViewController {

    private(set) var tableView: UITableView?
    private(set) var viewModel: ReceiptListViewModel?
    
    /// Initialised Method
    /// - Parameter tableView: TableView will be used to show saved receipts
    init(_ viewModel: ReceiptListViewModel = ReceiptListViewModel(), _ tableView: UITableView = BaseTableView(cellArray: [UITableViewCell.self])) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.tableView = tableView
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewReceipt))
    }

    @objc func addNewReceipt() {
        //self.navigationController?.present(ReceiptSaveViewController(), animated: true)
        self.navigationController?.pushViewController(ReceiptSaveViewController(), animated: true)
        //print("addNewReceipt")
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

