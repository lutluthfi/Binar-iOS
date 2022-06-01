//
//  ARSignInViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 31/05/22.
//

import UIKit

final class ARSignInViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupAddSubview()
        setupConstraint()
        setupNavBar()
    }
    
    private func setupAddSubview() {
    }
    
    private func setupConstraint() {
    }
    
    private func setupNavBar() {
        navigationItem.title = "Sign In"
        let signInBarButton = UIBarButtonItem(
            title: "Sign In",
            style: .plain,
            target: self,
            action: #selector(onSignInBarButtonTap)
        )
        navigationItem.leftBarButtonItems = [signInBarButton]
    }
    
    @objc private func onSignInBarButtonTap() {
    }
}
