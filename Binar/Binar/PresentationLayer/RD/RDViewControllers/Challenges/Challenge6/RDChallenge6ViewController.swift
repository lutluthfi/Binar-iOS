//
//  RDChallenge6ViewController.swift
//  Binar
//
//  Created by Raden Dimas on 12/04/22.
//

import UIKit


final class RDChallenge6ViewController: UIViewController {
    
    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.text = "Coming Soon..."
        label.font = .systemFont(ofSize: 18,weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(contentLabel)
        NSLayoutConstraint.activate([
            contentLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            contentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
