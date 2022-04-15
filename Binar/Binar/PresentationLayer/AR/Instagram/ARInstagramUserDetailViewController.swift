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
    lazy var captionLabel = IGCaptionLabel()
    lazy var avatarImageView = IGAvatarImageView()
    lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
            phoneNumberTextField, dateOfBirthTextField, likesLabel, usernameLabel
        ])
        view.axis = .vertical
        view.spacing = 16
        return view
    }()
    
    private let instagramAPI = InstagramAPI(appId: "6257aed4bbcd232e233bfdcb")
    
    var idUser: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddSubview()
        setupConstraint()
        setupView()
        loadUsers()
    }
    
    private func setupAddSubview() {
        view.addSubview(stackView)
        view.addSubview(captionLabel)
        view.addSubview(avatarImageView)
    }
    
    private func setupConstraint() {
        stackView.makeConstraint {[
            $0.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            $0.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            $0.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        ]}
        captionLabel.makeConstraint {[
            $0.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            $0.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            $0.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 20)
        ]}
        avatarImageView.makeConstraint {[
            $0.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            $0.trailingAnchor.constraint(lessThanOrEqualTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            $0.topAnchor.constraint(equalTo: self.captionLabel.bottomAnchor, constant: 20)
        ]}
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        dateOfBirthTextField.placeholder = "Date of Birth"
        phoneNumberTextField.placeholder = "Phone Number"
        
        likesLabel.configure(9_999)
        
        usernameLabel.onTap = {
            print("Username Label On Tap")
        }
        captionLabel.onTap = {
            print("Caption Label On Tap")
        }
        avatarImageView.onTap = {
            print("Avatar Image View On Tap")
        }
    }
    
    private func setUser(_ user: IGUserResponse) {
        dateOfBirthTextField.text = user.dateOfBirth
        phoneNumberTextField.text = user.phone
        
        let email = user.email
        let username = String(email.split(separator: "@").first ?? "null")
        usernameLabel.configure(username: username)
        
        captionLabel.configure(username: username, caption: "Another major benefit of using NumberFormatter is that it’ll automatically take the user’s current Locale into account when formatting our numbers. For instance, in some countries the number 50932.52 is expected to be formatted as 50 932,52, while other locales prefer 50,932.52 instead. All of those complexities are now handled for us completely automatically, which is most likely what we want when formatting user-facing numbers.\n\nHowever, when that’s not the case, and we’re instead looking for consistency across all locales, then we could either assign a specific Locale to our NumberFormatter, or we could configure it to use specific characters as its decimalSeparator and groupingSeparator")
        
        avatarImageView.configure(sizeType: .large, urlString: user.picture)
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
