//
//  RDDetailViewController.swift
//  Binar
//
//  Created by Raden Dimas on 03/04/22.
//

import UIKit

class RDDetailViewController: UIViewController {

    var animalDetail: Animal?

    private lazy var detailScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var detailContentView: UIView = {
        let detailContent = UIView()
        detailContent.translatesAutoresizingMaskIntoConstraints = false
        return detailContent
    }()

    private lazy var detailImageView: UIImageView = {
       let detailImage = UIImageView()
        detailImage.contentMode = .scaleAspectFill
        detailImage.clipsToBounds = true
        detailImage.loadImage(resource: animalDetail?.photoUrlString)
        detailImage.translatesAutoresizingMaskIntoConstraints = false
        return detailImage
    }()

    private lazy var detailTitleLabel: UILabel = {
        let detailLabel = UILabel()
        detailLabel.numberOfLines = 0
        detailLabel.font = .systemFont(ofSize: 32, weight: .heavy)
        detailLabel.sizeToFit()
        detailLabel.text = animalDetail?.name
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        return detailLabel
    }()

    private lazy var detailTypeLabel: UILabel = {
       let detailType = UILabel()
        detailType.numberOfLines = 0
        detailType.font = .systemFont(ofSize: 18, weight: .light)
        detailType.sizeToFit()
        detailType.text = animalDetail?.typeOfFood.rawValue
        detailType.translatesAutoresizingMaskIntoConstraints = false
        return detailType
    }()

    private lazy var detailStrengthLabel: UILabel = {
        let detailStrength = UILabel()
        detailStrength.numberOfLines = 0
        detailStrength.font = .systemFont(ofSize: 20, weight: .bold)
        detailStrength.sizeToFit()
        detailStrength.text = String(animalDetail?.strength ?? 0)
        detailStrength.translatesAutoresizingMaskIntoConstraints = false
        return detailStrength
    }()

    private lazy var detailDescLabel: UILabel = {
        let detailDesc = UILabel()
        detailDesc.numberOfLines = 0
        detailDesc.font = .systemFont(ofSize: 18, weight: .light)
        detailDesc.sizeToFit()
        detailDesc.text = animalDetail?.description
        detailDesc.translatesAutoresizingMaskIntoConstraints = false
        return detailDesc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = animalDetail?.name
        setupScrollView()
        setupDetailView()
    }

    func setupScrollView() {
        view.addSubview(detailScrollView)
        detailScrollView.addSubview(detailContentView)

        NSLayoutConstraint.activate([
            detailScrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailScrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            detailScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            detailScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            detailContentView.centerXAnchor.constraint(equalTo: detailScrollView.centerXAnchor),
            detailContentView.widthAnchor.constraint(equalTo: detailScrollView.widthAnchor),
            detailContentView.topAnchor.constraint(equalTo: detailScrollView.topAnchor),
            detailContentView.bottomAnchor.constraint(equalTo: detailScrollView.bottomAnchor),
        ])
    }

    func setupDetailView() {
        detailContentView.addSubview(detailImageView)
        detailContentView.addSubview(detailTitleLabel)
        detailContentView.addSubview(detailTypeLabel)
        detailContentView.addSubview(detailStrengthLabel)
        detailContentView.addSubview(detailDescLabel)

        NSLayoutConstraint.activate([
            detailImageView.centerXAnchor.constraint(equalTo: detailContentView.centerXAnchor),
            detailImageView.topAnchor.constraint(equalTo: detailContentView.topAnchor),
            detailImageView.heightAnchor.constraint(equalToConstant: 300),
            detailImageView.widthAnchor.constraint(equalTo: detailContentView.widthAnchor),

            detailTitleLabel.centerXAnchor.constraint(equalTo: detailContentView.centerXAnchor),
            detailTitleLabel.topAnchor.constraint(equalTo: detailImageView.bottomAnchor, constant: 5),
            detailTitleLabel.widthAnchor.constraint(equalTo: detailContentView.widthAnchor, multiplier: 4/5),

            detailTypeLabel.centerXAnchor.constraint(equalTo: detailContentView.centerXAnchor),
            detailTypeLabel.topAnchor.constraint(equalTo: detailTitleLabel.bottomAnchor, constant: 5),
            detailTypeLabel.widthAnchor.constraint(equalTo: detailContentView.widthAnchor, multiplier: 4/5),

            detailStrengthLabel.centerXAnchor.constraint(equalTo: detailContentView.centerXAnchor),
            detailStrengthLabel.topAnchor.constraint(equalTo: detailTypeLabel.bottomAnchor, constant: 5),
            detailStrengthLabel.widthAnchor.constraint(equalTo: detailContentView.widthAnchor, multiplier: 4/5),

            detailDescLabel.centerXAnchor.constraint(equalTo: detailContentView.centerXAnchor),
            detailDescLabel.topAnchor.constraint(equalTo: detailStrengthLabel.bottomAnchor, constant: 15),
            detailDescLabel.widthAnchor.constraint(equalTo: detailContentView.widthAnchor, multiplier: 4/5),
            detailDescLabel.bottomAnchor.constraint(equalTo: detailContentView.bottomAnchor),
        ])
    }

}

