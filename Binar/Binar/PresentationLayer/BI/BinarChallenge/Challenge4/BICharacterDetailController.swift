//
//  BICharacterDetailController.swift
//  Binar
//
//  Created by Bagas Ilham on 22/05/22.
//

import UIKit
import Kingfisher

class BICharacterDetailViewController: UIViewController {
    
    var detailedCharacter: BIGameCharacter?
    var scrollView = UIScrollView()
    var background = UIView()
    var characterImage = UIImageView()
    var characterDetail = UILabel()
    var playAsCharacterButton = UIButton()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupAddSubviews()
        setupConstraints()
        setupView()
    }
    
    private func setupNavigationBar() {
        title = detailedCharacter?.fullName
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = true
    }
    
    private func setupAddSubviews() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(background)
        scrollView.addSubview(characterImage)
        scrollView.addSubview(characterDetail)
        scrollView.addSubview(playAsCharacterButton)
        
    }
    
    private func setupView() {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 1.75)
        
        background.translatesAutoresizingMaskIntoConstraints = false
        switch (detailedCharacter!.characterColor) {
            
        case .orange:
            background.backgroundColor = .systemOrange
            
        case .blue:
            background.backgroundColor = .systemBlue
            
        case .green:
            background.backgroundColor = .systemGreen
            
        case .last:
            background.backgroundColor = .systemPink
            
        default:
            background.backgroundColor = .systemGray
        }
        
        characterImage.contentMode = .scaleAspectFit
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        characterImage.clipsToBounds = true
        characterImage.kf.setImage(with: URL(string: detailedCharacter!.imageURLString))
        characterImage.kf.indicatorType = .activity
        
        characterDetail.translatesAutoresizingMaskIntoConstraints = false
        characterDetail.text = detailedCharacter?.description
        characterDetail.numberOfLines = 100
        characterDetail.textAlignment = .justified
        
        playAsCharacterButton.translatesAutoresizingMaskIntoConstraints = false
        playAsCharacterButton.setTitle("Play as \(detailedCharacter?.firstName ?? "this character")", for: .normal)
        playAsCharacterButton.backgroundColor = background.backgroundColor
        playAsCharacterButton.layer.cornerRadius = 12
        playAsCharacterButton.addTarget(Any.self, action: #selector(goToPaymentViewController), for: .touchUpInside)
        
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            view.heightAnchor.constraint(greaterThanOrEqualToConstant: view.frame.height),
            view.widthAnchor.constraint(greaterThanOrEqualToConstant: view.frame.width),
            
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor),

            background.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            background.heightAnchor.constraint(equalToConstant: 270),
            background.bottomAnchor.constraint(equalTo: characterImage.bottomAnchor),
            
            characterImage.topAnchor.constraint(equalTo: scrollView.topAnchor),
            characterImage.widthAnchor.constraint(equalToConstant: 220),
            characterImage.heightAnchor.constraint(equalToConstant: 360),
            characterImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            characterDetail.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            characterDetail.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            characterDetail.topAnchor.constraint(equalTo: background.bottomAnchor, constant: 15),
            
            playAsCharacterButton.topAnchor.constraint(equalTo: characterDetail.bottomAnchor, constant: 25),
            playAsCharacterButton.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor),
            playAsCharacterButton.heightAnchor.constraint(equalToConstant: 40),
            playAsCharacterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        
        if detailedCharacter?.fullName == "Tonya Wiggins" || detailedCharacter?.fullName == "David Norton" {
            characterImage.heightAnchor.constraint(equalToConstant: 330).isActive = true
        }
        
    }
}

extension BICharacterDetailViewController {
    
    @objc func goToPaymentViewController() {
        let viewController = BIGamePaymentController()
        viewController.playedCharacter = detailedCharacter
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

