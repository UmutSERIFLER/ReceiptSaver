//
//  ReceiptSaveViewController.swift
//  ReceiptSaver
//
//  Created by Umut SERIFLER on 19/04/2021.
//

import UIKit

class ReceiptSaveViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker: ImagePicker!
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "photo_imageholder")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var dateLabel: UILabel = {
        return UILabel.make("Date: ",textColor: .black, fontSize: 16, alignment: .left)
    }()
    
    lazy var totalPriceButton: UIButton = {
        let priceButton = UIButton.make(nil, .black, "Total Price: ")
        priceButton.addTarget(self, action: #selector(setReceiptPrice), for: .touchUpInside)
        return priceButton
    }()
    
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
            
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "camera_icon"), style: .plain, target: self, action: #selector(openImagePicker(_:)))
        
        // Add an event to call onDidChangeDate function when value is changed.
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUIComponents()
    }
    
    func updateUIComponents() {
        // Add DataPicker to the view
        view.addSubview(dateLabel)
        view.addSubview(datePicker)
        view.addSubview(imageView)
        view.addSubview(totalPriceButton)
        
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
        ])
    }
    
    @objc func openImagePicker(_ sender: UIButton) {
        self.imagePicker.present(from: sender)
    }
    
    @objc func setReceiptPrice() {
        let alertController = UIAlertController.make(placeHolder: "Please enter total price..") { [weak self] (textMessage) in
            if let validPrice = textMessage?.double {
                self?.totalPriceButton.setTitle("Total Price: \(validPrice.formattedPrice())", for: .normal)
            }
            
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        let selectedDate: String = DateFormatter().formattedDate(date: sender.date)
        print("Selected value \(selectedDate)")
    }
    
}
extension ReceiptSaveViewController: ImagePickerDelegate {

    func didSelect(image: UIImage?) {
        self.imageView.image = image
    }
}
