//
//  ARInstagramUserDetailViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 14/04/22.
//

import UIKit

final class ARInstagramUserDetailViewController: UIViewController {
    lazy var dateOfBirthTextField = UITextField()
    lazy var phoneNumberTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let stackView = UIStackView(arrangedSubviews: [phoneNumberTextField, dateOfBirthTextField])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.makeConstraint {[
            $0.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            $0.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            $0.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        ]}
        dateOfBirthTextField.placeholder = "Date of Birth"
        phoneNumberTextField.placeholder = "Phone Number"
    }
    
    private func setUser(_ user: IGUserResponse) {
        dateOfBirthTextField.text = user.dateOfBirth
        phoneNumberTextField.text = user.phone
    }
}
