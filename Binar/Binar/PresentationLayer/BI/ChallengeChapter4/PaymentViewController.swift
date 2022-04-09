//
//  PaymentViewController.swift
//  Challenge 4
//
//  Created by Bagas on 09/04/22.
//

import UIKit
import LocalAuthentication

class BIPaymentViewController: UIViewController {
    
    var playedCharacter: GameCharacter?
    var playAsCharacterLabel = UILabel()
    var benefitLabel = UILabel()
    var paymentChoiceTableView = UITableView(frame: .zero, style: .insetGrouped)
    var nextButton = UIButton()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "Payment"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        paymentChoiceTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell2")
        paymentChoiceTableView.delegate = self
        paymentChoiceTableView.dataSource = self
        
        addViews()
        setupViews()
        setupConstraints()
        
    }
    
    fileprivate func addViews() {
        
        view.addSubview(playAsCharacterLabel)
        view.addSubview(benefitLabel)
        view.addSubview(paymentChoiceTableView)
        view.addSubview(nextButton)
        
    }
    
    fileprivate func setupViews() {
        
        playAsCharacterLabel.translatesAutoresizingMaskIntoConstraints = false
        playAsCharacterLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        playAsCharacterLabel.textColor = .label
        playAsCharacterLabel.textAlignment = .center
        playAsCharacterLabel.text = "Play as " + playedCharacter!.firstName
        
        benefitLabel.translatesAutoresizingMaskIntoConstraints = false
        benefitLabel.textAlignment = .left
        benefitLabel.text = "Choose your payment method:"
        benefitLabel.textColor = .label
        
        paymentChoiceTableView.translatesAutoresizingMaskIntoConstraints = false
        paymentChoiceTableView.backgroundColor = .systemBackground
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Confirm Payment", for: .normal)
        
        nextButton.setTitle("Please select a payment method", for: .disabled)
        nextButton.setTitleColor(.label, for: .disabled)
        nextButton.layer.cornerRadius = 12
        nextButton.backgroundColor = .systemGray6
        nextButton.addTarget(Any.self, action: #selector(payment), for: .touchUpInside)
        nextButton.isEnabled = false
        
    }
    
    fileprivate func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            playAsCharacterLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            playAsCharacterLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            playAsCharacterLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            
            benefitLabel.topAnchor.constraint(equalTo: playAsCharacterLabel.bottomAnchor, constant: 10),
            benefitLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            benefitLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),

            paymentChoiceTableView.topAnchor.constraint(equalTo: benefitLabel.bottomAnchor),
            paymentChoiceTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            paymentChoiceTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            paymentChoiceTableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            paymentChoiceTableView.heightAnchor.constraint(equalToConstant: 250),
            
            nextButton.topAnchor.constraint(equalTo: paymentChoiceTableView.bottomAnchor, constant: 40),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 350),
            nextButton.heightAnchor.constraint(equalToConstant: 40)
            
        ])
        
    }
    
}

extension BIPaymentViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let methods = ["Apple Card", "Mastercard", "VISA"]
        let methodImageURL = ["https://help.apple.com/assets/60524663CAC98111BE6AA3F5/60524669CAC98111BE6AA400/en_US/1a01714520928f8f3ddd94b987ebce04.png",
                              "https://img.icons8.com/color/344/mastercard-logo.png",
                              "https://img.icons8.com/color/452/visa.png"]
        let methodImage = UIImageView()
        let methodLabel = UILabel()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell2", for: indexPath)
        
        cell.contentView.addSubview(methodImage)
        cell.contentView.addSubview(methodLabel)
        
        cell.backgroundColor = .secondarySystemBackground
        
        methodImage.translatesAutoresizingMaskIntoConstraints = false
        methodImage.loadImage(resource: methodImageURL[row])
        methodImage.contentMode = .scaleAspectFit
        methodImage.clipsToBounds = true
        methodImage.layer.cornerRadius = 6
        
        methodLabel.translatesAutoresizingMaskIntoConstraints = false
        methodLabel.text = methods[row]
        
        NSLayoutConstraint.activate([
        
            cell.heightAnchor.constraint(equalToConstant: 70),
            cell.contentView.heightAnchor.constraint(equalToConstant: 70),
            
            methodImage.heightAnchor.constraint(equalToConstant: 50),
            methodImage.widthAnchor.constraint(equalToConstant: 100),
            methodImage.leftAnchor.constraint(equalTo: cell.contentView.leftAnchor, constant: 10),
            methodImage.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
            
            methodLabel.leftAnchor.constraint(equalTo: methodImage.rightAnchor, constant: 10),
            methodLabel.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor)
            
        ])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        nextButton.isEnabled = true
        nextButton.backgroundColor = .systemPink
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
    }
    
    
}

extension BIPaymentViewController {
    
    @objc func payment() {

        let context = LAContext()
        var error: NSError?
        var isSuccess: Bool = false

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {

            let reason = "Authenticate your payment with Face ID."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                
                if success {
                    isSuccess = true
                } else {
                    
                }
            }
        } else {
            let alert = UIAlertController(title: "Biometry unavailable", message: "Your device is not configured for biometric authentication.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
        
        if isSuccess == true {
            self.navigationController?.popViewController(animated: true)
        }
    }

}
