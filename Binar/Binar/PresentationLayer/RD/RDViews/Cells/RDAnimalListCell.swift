//
//  RDAnimalListCell.swift
//  Binar
//
//  Created by Raden Dimas on 03/04/22.
//

import UIKit

class RDAnimalListCell: UITableViewCell {

    private lazy var rdImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
//        imageView.layer.cornerRadius = 9
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var rdTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        //        titleLabel.preferredMaxLayoutWidth = 180
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()

    private lazy var rdTypeLabel: UILabel = {
       let typeLabel = UILabel()
        typeLabel.numberOfLines = 0
        typeLabel.adjustsFontSizeToFitWidth = true
        typeLabel.font = .systemFont(ofSize: 16, weight: .regular)
//        typeLabel.preferredMaxLayoutWidth = 180
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
       return typeLabel
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCell() {
        addSubview(rdImageView)
        addSubview(rdTitleLabel)
        addSubview(rdTypeLabel)

        NSLayoutConstraint.activate([
            rdImageView.centerYAnchor.constraint(equalTo: centerYAnchor), // testing without it
            rdImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            rdImageView.heightAnchor.constraint(equalToConstant: 85),
            rdImageView.widthAnchor.constraint(equalToConstant: 85),

            rdTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            rdTitleLabel.leadingAnchor.constraint(equalTo: rdImageView.trailingAnchor, constant: 10),

            rdTypeLabel.topAnchor.constraint(equalTo: rdTitleLabel.bottomAnchor, constant: 7),
            rdTypeLabel.leadingAnchor.constraint(equalTo: rdImageView.trailingAnchor, constant: 10),
            rdTypeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
        ])
    }

    func fill(with animal: Animal) {
        rdImageView.loadImage(resource: animal.photoUrlString)
        rdTitleLabel.text = animal.name
        rdTypeLabel.text = animal.typeOfFood.rawValue
    }

}
