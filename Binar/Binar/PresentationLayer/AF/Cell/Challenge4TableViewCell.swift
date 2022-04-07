//
//  Challenge4TableViewCell.swift
//  Binar
//
//  Created by Adji Firmansyah on 4/3/22.
//

import UIKit

class Challenge4TableViewCell: UITableViewCell {
  static let reuseIdentifier = "coffeeCell"
  private var amount: Int = 0
  private var stockProduct: Int = 0
  lazy var imageOfCoffee: UIImageView = {
    let image = UIImageView()
    image.layer.cornerRadius = 8
    image.clipsToBounds = true
    image.contentMode = .scaleAspectFill
    
    return image
  }()
  
  lazy var nameLabel: UILabel = {
    let name = UILabel()
    name.font = .systemFont(ofSize: 16, weight: .bold)
    name.tintColor = .black
    
    return name
  }()
  
  lazy var descOfCoffeLabel: UILabel = {
    let desc = UILabel()
    desc.font = .systemFont(ofSize: 10, weight: .regular)
    desc.tintColor = .gray
    desc.lineBreakMode = .byCharWrapping
    return desc
  }()
  
  lazy var priceLabel: UILabel = {
    let price = UILabel()
    price.font = .systemFont(ofSize: 16, weight: .bold)
    price.tintColor = .black
    
    return price
  }()
  
  lazy var addButton: UIButton = {
    let button = UIButton()
    button.setTitle("Add", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
    button.layer.cornerRadius = 8
    button.backgroundColor = UIColor(red: 210/255, green: 159/255, blue: 120/255, alpha: 1)
    
    return button
  }()
  
  let addStepper: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
    button.backgroundColor = .clear
    button.tintColor = UIColor(red: 210/255, green: 159/255, blue: 120/255, alpha: 1)
    
    return button
  }()
  
  let minusStepper: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "minus.circle"), for: .normal)
    button.backgroundColor = .clear
    button.tintColor = UIColor(red: 210/255, green: 159/255, blue: 120/255, alpha: 1)
    return button
  }()
  
  let amountLabel: UILabel = {
    let amount = UILabel()
    amount.font = .systemFont(ofSize: 12, weight: .bold)
    amount.textAlignment = .center
    return amount
  }()
  
  lazy var topLabelSV: UIStackView = {
    let top = UIStackView()
    top.axis = .vertical
    top.distribution = .fillProportionally
    top.spacing = 0
    return top
  }()
  
  lazy var bottomLabelSV: UIStackView = {
    let top = UIStackView()
    top.axis = .horizontal
    top.distribution = .fillProportionally
    top.spacing = 0
    return top
  }()
  
  lazy var steperSV: UIStackView = {
    let top = UIStackView()
    top.axis = .horizontal
    top.distribution = .fillProportionally
    top.spacing = 0
    return top
  }()
  
  lazy var LabelStackView: UIStackView = {
    let top = UIStackView()
    top.axis = .vertical
    top.spacing = 8
    
    return top
  }()
  
  lazy var stackView: UIStackView = {
    let stack = UIStackView()
    stack.axis = .horizontal
    stack.distribution = .fillProportionally
    stack.alignment = .center
    stack.spacing = 8
    return stack
  }()
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(stackView)
    setupStackView()
    
  }
  
  func fill(coffee: HotCoffee) {
    nameLabel.text = coffee.name
    descOfCoffeLabel.text = coffee.descCoffee
    priceLabel.text = "Rp. \(coffee.price)"
    imageOfCoffee.loadImage(resource: coffee.photoUrlString)
    stockProduct = coffee.stock
    amountLabel.text = "\(0)"
  }
  
  func setupStackView() {
    addButton.addTarget(self, action: #selector(addAction), for: .touchUpInside)
    addStepper.addTarget(self, action: #selector(plusAction), for: .touchUpInside)
    minusStepper.addTarget(self, action: #selector(minusAction), for: .touchUpInside)
    topLabelSV.addArrangedSubview(nameLabel)
    topLabelSV.addArrangedSubview(descOfCoffeLabel)
    
    steperSV.addArrangedSubview(minusStepper)
    steperSV.addArrangedSubview(amountLabel)
    steperSV.addArrangedSubview(addStepper)
    
    bottomLabelSV.addArrangedSubview(priceLabel)
    bottomLabelSV.addArrangedSubview(steperSV)
    bottomLabelSV.addArrangedSubview(addButton)
    steperSV.isHidden = true
    
    LabelStackView.addArrangedSubview(topLabelSV)
    LabelStackView.addArrangedSubview(bottomLabelSV)
    
    stackView.addArrangedSubview(imageOfCoffee)
    stackView.addArrangedSubview(LabelStackView)
    
    setupConstraint()
  }
  
  func setupConstraint() {
    imageOfCoffee.translatesAutoresizingMaskIntoConstraints = false
    stackView.translatesAutoresizingMaskIntoConstraints = false
    addButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      imageOfCoffee.heightAnchor.constraint(equalToConstant: 80),
      imageOfCoffee.widthAnchor.constraint(equalToConstant: 80),
      
      addButton.widthAnchor.constraint(equalToConstant: 42),
      
      steperSV.widthAnchor.constraint(equalToConstant: 80),
      
      stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
      stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
      stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
    ])
  }
}

extension Challenge4TableViewCell {
  @objc func addAction() {
    amount += 1
    amountLabel.text = "\(amount)"
    addButton.isHidden = true
    steperSV.isHidden = false
  }
  
  @objc func plusAction() {
    guard amount < stockProduct else { return }
    amount += 1
    amountLabel.text = "\(amount)"
    print(amount)
  }
  
  @objc func minusAction() {
    if amount > 0 {
      amount -= 1
      amountLabel.text = "\(amount)"
      print(amount)
      if amount == 0 {
        steperSV.isHidden = true
        addButton.isHidden = false
      }
    }
  }
}
