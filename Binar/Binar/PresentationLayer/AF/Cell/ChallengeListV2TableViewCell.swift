//
//  ChallengeListV2TableViewCell.swift
//  Binar
//
//  Created by Adji Firmansyah on 4/2/22.
//

import UIKit

class ChallengeListV2TableViewCell: UITableViewCell {
  static let reuseIdentifier = "AFCell"
  lazy var bgColor: UIColor = UIColor.random
  lazy var nameOfAnimalLabel = UILabel()
  lazy var typeOfFood = UILabel()
  lazy var descOfAnimalLabel = UILabel()
  lazy var imageOfAnimal = UIImageView()
  lazy var bgView = UIView()
  lazy var stackView = UIStackView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    contentView.addSubview(bgView)

  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func fill(with animal: Animal) {
    
    nameOfAnimalLabel.tintColor = .black
    nameOfAnimalLabel.font = .systemFont(ofSize: 16, weight: .bold)
    nameOfAnimalLabel.text = animal.name
    nameOfAnimalLabel.textAlignment = .left

    typeOfFood.font = .systemFont(ofSize: 12, weight: .medium)
    typeOfFood.tintColor = .black
    typeOfFood.text = animal.typeOfFood.rawValue
      
    imageOfAnimal.loadImage(resource: animal.photoUrlString)
    imageOfAnimal.contentMode = .scaleAspectFill
    imageOfAnimal.loadImage(resource: animal.photoUrlString)
    
    stackView.axis = .vertical
    stackView.spacing = 4
    
    stackView.addArrangedSubview(nameOfAnimalLabel)
    stackView.addArrangedSubview(typeOfFood)
    
    bgView.addSubview(imageOfAnimal)
    bgView.addSubview(stackView)
    bgView.backgroundColor = UIColor.random
    bgView.layer.cornerRadius = 8
    
    setConstraint(image: imageOfAnimal)
  }
  
  private func setConstraint(image: UIImageView) {
    
    bgView.translatesAutoresizingMaskIntoConstraints = false
    bgView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 32).isActive = true
    bgView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
    bgView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor).isActive = true
    bgView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 8).isActive = true
    stackView.leadingAnchor.constraint(equalTo: bgView.layoutMarginsGuide.leadingAnchor, constant: 8).isActive = true
    
    
    imageOfAnimal.translatesAutoresizingMaskIntoConstraints = false
    imageOfAnimal.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
    imageOfAnimal.leadingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
    imageOfAnimal.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -16 ).isActive = true
    imageOfAnimal.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: 0).isActive = true
    imageOfAnimal.widthAnchor.constraint(equalToConstant: 96).isActive = true
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
}

extension UIColor {
  static var random: UIColor {
    return UIColor(
      red: .random(in: 0...1),
      green: .random(in: 0...1),
      blue: .random(in: 0...1),
      alpha: 0.5
    )
  }
}

