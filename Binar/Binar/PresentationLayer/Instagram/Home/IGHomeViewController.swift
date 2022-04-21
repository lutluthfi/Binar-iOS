//
//  IGHomeViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 12/04/22.
//

import UIKit

final class IGHomeViewController: UIViewController {
    lazy var creatorView = IGFeedCreatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddSubview()
        setupConstraint()
        
        creatorView.onAvatarImageViewTap = { [weak self] in
            let nextController = UIViewController()
            nextController.view.backgroundColor = .systemRed
            self?.navigationController?.pushViewController(nextController, animated: true)
        }
        creatorView.configure(username: "binar.academy", avatarUrlString: "https://educationalliancefinland.com/sites/default/files/styles/product-cover/public/products/a631b33f-5c62-4c9c-b9d9-2d2961b8aded.png")
    }
    
    private func setupAddSubview() {
        view.addSubview(creatorView)
    }
    
    private func setupConstraint() {
        creatorView.makeConstraint {[
            $0.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            $0.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            $0.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ]}
    }
}
