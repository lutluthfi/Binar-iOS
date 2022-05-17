//
//  IGHomeCreateFeedViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 17/05/22.
//

import UIKit

final class IGHomeCreateFeedViewController: UIViewController {
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.backgroundColor = .systemGray
        return view
    }()
    lazy var captionTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Write your caption here"
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddSubview()
        setupConstraint()
        setupNavBar()
        setupView()
    }
    
    private func setupAddSubview() {
        view.addSubview(imageView)
        view.addSubview(captionTextField)
    }
    
    private func setupConstraint() {
        imageView.makeConstraint(builder: {
            $0.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
            $0.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
            $0.bottomAnchor.constraint(equalTo: view.centerYAnchor)
        })
        captionTextField.makeConstraint(builder: {
            $0.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
            $0.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
            $0.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20)
        })
    }
    
    private func setupNavBar() {
        let nextBarButton = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(onNextBarButtonTap))
        navigationController?.navigationItem.rightBarButtonItems = [nextBarButton]
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    @objc private func onNextBarButtonTap() {
        print("Next")
    }
}
