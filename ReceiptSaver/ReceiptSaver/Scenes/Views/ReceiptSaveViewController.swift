//
//  ReceiptSaveViewController.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 19/04/2021.
//

import UIKit

protocol ReceiptSaveViewControllerDelegate {
    func saveUpdateReceipt(with: Any)
}

class ReceiptSaveViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private var imagePicker: ImagePicker?
    private(set) var receipt: ReceiptModel?
    
    var delegate: ReceiptSaveViewControllerDelegate?
    
    lazy var imageView = UIImageView.make(#imageLiteral(resourceName: "photo_imageholder"))
    
    lazy var dateLabel = UILabel.make(Constants.date, textColor: .black, fontSize: 16, alignment: .left)
    
    lazy var currencyButton: UIButton =  UIButton.make(nil, .black, Constants.currency)
    
    lazy var totalPriceButton: UIButton =  UIButton.make(nil, .black, Constants.totalPrice)
    
    lazy var datePicker: UIDatePicker = UIDatePicker.make(defaultDate: receipt?.timeStamp)
    
    lazy var saveReceiptButton = UIButton.make(nil, .black, Constants.saveReceipt, .center)
    
    
    init(_ receipt: ReceiptModel? = ReceiptModel(), delegation: ReceiptSaveViewControllerDelegate? = nil) {
        self.receipt = receipt
        self.delegate = delegation
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        self.title = self.receipt?.timeStamp
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "camera_icon"), style: .plain, target: self, action: #selector(openImagePicker(_:)))
        
        datePicker.addTarget(self, action: #selector(setNewDate(picker:)), for: .valueChanged)
        
        totalPriceButton.addTarget(self, action: #selector(setReceiptPrice), for: .touchUpInside)
        
        currencyButton.addTarget(self, action: #selector(setCurrency), for: .touchUpInside)
        
        saveReceiptButton.addTarget(self, action: #selector(saveReceipt), for: .touchUpInside)
        
        imagePicker = ImagePicker(presentationController: self, delegate: self)
        
        
        guard let receipt = self.receipt, let imageData = receipt.receiptImage else {
            self.receipt?.timeStamp = DateFormatter().fromDateToString(date: datePicker.date)
            return
        }
        
        imageView.image = UIImage(data: Data(referencing: imageData))
        self.totalPriceButton.setTitle("\(Constants.totalPrice)\(receipt.totalPrice)", for: .normal)
        self.currencyButton.setTitle("\(Constants.currency)\(receipt.currency)", for: .normal)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUIComponents()
    }
    
    func updateUIComponents() {
        
        view.addSubview(imageView)
        view.addSubview(dateLabel)
        view.addSubview(datePicker)
        view.addSubview(totalPriceButton)
        view.addSubview(currencyButton)
        view.addSubview(saveReceiptButton)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            imageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.95),
            imageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.4),
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            dateLabel.widthAnchor.constraint(equalToConstant: 50),
            dateLabel.heightAnchor.constraint(equalToConstant: 30),
            
            datePicker.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
            datePicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            datePicker.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor),
            datePicker.heightAnchor.constraint(equalTo: dateLabel.heightAnchor),
            
            totalPriceButton.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            totalPriceButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            totalPriceButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            totalPriceButton.heightAnchor.constraint(equalToConstant: 30),
            
            currencyButton.topAnchor.constraint(equalTo: totalPriceButton.bottomAnchor, constant: 10),
            currencyButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            currencyButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            currencyButton.heightAnchor.constraint(equalToConstant: 30),
            
            saveReceiptButton.topAnchor.constraint(equalTo: currencyButton.bottomAnchor, constant: 10),
            saveReceiptButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            saveReceiptButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            saveReceiptButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    @objc func setNewDate(picker: UIDatePicker) {
        receipt?.timeStamp = DateFormatter().fromDateToString(date: picker.date)
    }
    
    @objc func openImagePicker(_ sender: UIButton) {
        self.imagePicker?.present(from: sender)
    }
    
    @objc func setReceiptPrice() {
        takeInputFromUser(with: Constants.priceInputMessage) { [weak self] (message) in
            if let validPrice = message?.double {
                self?.receipt?.totalPrice = validPrice.formattedPrice()
                self?.totalPriceButton.setTitle("\(Constants.totalPrice)\(validPrice.formattedPrice())", for: .normal)
            }
        }
    }
    
    @objc func setCurrency() {
        takeInputFromUser(with: Constants.currencyInputMessage) { [weak self] (message) in
            if let message = message, !message.isEmpty {
                self?.receipt?.currency = message
                self?.currencyButton.setTitle("\(Constants.currency)\(message)", for: .normal)
            }
        }
    }
    
    
    func takeInputFromUser(with message:String, value: @escaping (String?)->()) {
        let alertController = UIAlertController.make(message: message) { (textMessage) in
            value(textMessage)
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func saveReceipt() {
        
        guard let receipt = self.receipt, let _ = receipt.receiptImage, receipt.isObjectSavingEnabled else {
            self.showAlert(with: Constants.missingFieldErrorMessage)
            return
        }
        delegate?.saveUpdateReceipt(with: receipt)
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension ReceiptSaveViewController: ImagePickerDelegate {
    
    func didSelect(image: UIImage?) {
        guard let image = image, let imageData = image.pngData() else {
            return
        }
        self.receipt?.receiptImage = NSData(data: imageData)
        self.imageView.image = image
    }
}
