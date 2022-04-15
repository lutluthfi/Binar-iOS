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
    lazy var likesLabel = IGLikesLabel()
    lazy var usernameLabel = IGUsernameLabel()
    
    private let instagramAPI = InstagramAPI(appId: "6257aed4bbcd232e233bfdcb")
    
    var idUser: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let stackView = UIStackView(arrangedSubviews: [
            phoneNumberTextField, dateOfBirthTextField, likesLabel, usernameLabel
        ])
        stackView.axis = .vertical
        stackView.spacing = 16
        view.addSubview(stackView)
        view.backgroundColor = .white
        stackView.makeConstraint {[
            $0.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            $0.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            $0.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        ]}
        dateOfBirthTextField.placeholder = "Date of Birth"
        phoneNumberTextField.placeholder = "Phone Number"
        
        likesLabel.configure(9_999)
        usernameLabel.onTap = {
            print("Username Label On Tap")
        }
        
        loadUsers()
    }
    
    private func setUser(_ user: IGUserResponse) {
        dateOfBirthTextField.text = user.dateOfBirth
        phoneNumberTextField.text = user.phone
        let email = user.email
        let username = String(email.split(separator: "@").first ?? "null")
        usernameLabel.configure(username: username)
    }
    
    private func loadUsers() {
        instagramAPI.getDetailUser(id:idUser) { [weak self] (result) in
            guard let _self = self else { return }
            switch result {
            case let .success(data):
                _self.setUser(data)
            case let .failure(error):
                print(String(describing: error))
            }
        }
    }
    
}
