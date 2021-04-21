//
//  ReceiptListViewController.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 19/04/2021.
//

import UIKit

class ReceiptListViewController: UITableViewController {

    private(set) var viewModel: ReceiptListViewModel?
    
    /// Initialised Method
    /// - Parameter tableView: TableView will be used to show saved receipts
    init(_ viewModel: ReceiptListViewModel = ReceiptListViewModel(), _ tableView: UITableView = BaseTableView(cellArray: [ReceiptTableViewCell.self])) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.tableView = tableView
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        initViewModel()
        
        self.tableView?.reloadData()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewReceipt))
    }
    
    func initViewModel() {
        
        viewModel?.reloadTableViewClosure = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel?.updateLoadingStatusClosure = { [weak self] (deletions,insertions,updates) in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
        }
        
        viewModel?.showAlertClosure = { [weak self] errorMessage in
            guard let errorMessage = errorMessage else { return }
           // self?.showAlert(withMessage: errorMessage)
        }
    }

    @objc func addNewReceipt() {
        self.navigationController?.pushViewController(ReceiptSaveViewController(delegation: self), animated: true)
    }

}

extension ReceiptListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.retrieveNumberOfItems() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let receiptCell : ReceiptTableViewCell = tableView.dequeueReusableCell(withIdentifier: ReceiptTableViewCell.identifier, for: indexPath) as? ReceiptTableViewCell, let receipt: Receipt = self.viewModel?.getData(at: indexPath) as? Receipt {
            receiptCell.receipt = receipt
            return receiptCell
        }
        return UITableViewCell()
    }
    
}

extension ReceiptListViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let receiptCell: ReceiptTableViewCell = tableView.cellForRow(at: indexPath) as? ReceiptTableViewCell {
            guard let receipt = receiptCell.receipt else { return }
            DispatchQueue.main.async { [weak self] in
                self?.navigationController?.pushViewController(ReceiptSaveViewController(receipt, delegation: self), animated: true)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

extension ReceiptListViewController: ReceiptSaveViewControllerDelegate {
    func saveUpdateReceipt(with data: Receipt) {
        viewModel?.saveUpdate(with: data)
    }
}

