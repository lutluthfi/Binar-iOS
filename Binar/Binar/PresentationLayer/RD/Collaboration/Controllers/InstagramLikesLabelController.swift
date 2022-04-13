//
//  InstagramLikesLabelController.swift
//  Binar
//
//  Created by Raden Dimas on 13/04/22.
//

import UIKit

final class InstagramLikesLabelController: UIViewController {
    
    var totalLikes: Int = 0
    var titleLikes: String = "Like"
    var isTapped: Bool = false
    
    private lazy var instagramLikesView: UIView = {
        let likesView = UIView()
        likesView.backgroundColor = .blue
        likesView.translatesAutoresizingMaskIntoConstraints = false
        return likesView
    }()
    
    private lazy var totalLikesLabel: UILabel = {
        let likesLabel = UILabel()
        likesLabel.text = String(totalLikes.withCommas())
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        return likesLabel
    }()
    
    private lazy var titleLikesLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = titleLikes
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private lazy var buttonLikes: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.setTitle("Like", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonLikesAgain: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.setTitle("Like Again", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTappedAgain), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view = InstagramLikesLabelView()
        view.backgroundColor = .white
        setupView()
    }
    
    private func setupView() {
        view.addSubview(instagramLikesView)
        view.addSubview(buttonLikes)
        view.addSubview(buttonLikesAgain)
        instagramLikesView.addSubview(totalLikesLabel)
        instagramLikesView.addSubview(titleLikesLabel)
        
        NSLayoutConstraint.activate([
            instagramLikesView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            instagramLikesView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            instagramLikesView.heightAnchor.constraint(equalToConstant: 50),
            instagramLikesView.widthAnchor.constraint(equalToConstant: 350),
            
            totalLikesLabel.centerYAnchor.constraint(equalTo: instagramLikesView.centerYAnchor),
            totalLikesLabel.leadingAnchor.constraint(equalTo: instagramLikesView.leadingAnchor,constant: 10),
            totalLikesLabel.trailingAnchor.constraint(equalTo: totalLikesLabel.trailingAnchor),
            
            titleLikesLabel.topAnchor.constraint(equalTo: totalLikesLabel.topAnchor),
            titleLikesLabel.leadingAnchor.constraint(equalTo: totalLikesLabel.trailingAnchor,constant: 5),
            
            buttonLikes.topAnchor.constraint(equalTo: instagramLikesView.bottomAnchor,constant: 20),
            buttonLikes.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            buttonLikes.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            buttonLikes.heightAnchor.constraint(equalToConstant: 55),
            
            buttonLikesAgain.topAnchor.constraint(equalTo: buttonLikes.bottomAnchor,constant: 20),
            buttonLikesAgain.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            buttonLikesAgain.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            buttonLikesAgain.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    @objc private func buttonTapped() {
        
        isTapped = !isTapped
        if isTapped {
            DispatchQueue.main.async {
                self.totalLikes = self.totalLikes + 1
                self.totalLikesLabel.text = String(self.totalLikes.withCommas())
                self.identifyTitleLikes()
            }
        } else {
            DispatchQueue.main.async {
                self.totalLikes = self.totalLikes - 1
                self.totalLikesLabel.text = String(self.totalLikes.withCommas())
                self.identifyTitleLikes()
            }
            
        }
    }
    
    @objc private func buttonTappedAgain() {
        totalLikes = totalLikes + 1
        totalLikesLabel.text = String(totalLikes.withCommas())
        identifyTitleLikes()
    }
    
    private func identifyTitleLikes() {
        if totalLikes > 1 {
            DispatchQueue.main.async {
                self.titleLikesLabel.text = self.titleLikes + "s"
            }
            
        } else {
            DispatchQueue.main.async {
                self.titleLikesLabel.text = self.titleLikes
            }
        }
    }
    
    private func identifyFormatNumber() {}
    
    
}

extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}

