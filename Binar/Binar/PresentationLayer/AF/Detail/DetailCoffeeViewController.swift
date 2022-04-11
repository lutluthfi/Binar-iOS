//
//  DetailCoffeeViewController.swift
//  Binar
//
//  Created by Adji Firmansyah on 4/10/22.
//

import UIKit

class DetailCoffeeViewController: UIViewController {
  lazy var containerView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemBlue
    return view
  }()
  
  lazy var containerLabel: UIView = {
    let view = UIView()
    view.backgroundColor = .red
    return view
  }()
  
  lazy var detailImage: UIImageView = {
    let image = UIImageView()
    image.contentMode = .scaleAspectFill
    image.clipsToBounds = true
    return image
  }()
  
  let textLabel: UILabel = {
    let text = UILabel()
    text.font = .systemFont(ofSize: 24, weight: .bold)
    text.tintColor = .black
    return text
  }()
  
  let priceLabel: UILabel = {
    let text = UILabel()
    text.font = .systemFont(ofSize: 16, weight: .semibold)
    text.tintColor = .black
    text.alpha = 0.5
    return text
  }()
  
  let descriptionLabel: UILabel = {
    let text = UILabel()
    text.font = .systemFont(ofSize: 16, weight: .bold)
    text.tintColor = .black
    return text
  }()
  
  let desclabel: UILabel = {
    let text = UILabel()
    text.font = .systemFont(ofSize: 16, weight: .regular)
    text.tintColor = .black
    text.alpha = 0.5
    text.numberOfLines = 0
    return text
  }()
  
  let stackView: UIStackView = {
    let stack = UIStackView()
    stack.axis = .vertical
    stack.spacing = 32
    return stack
  }()
  
  let titleStackView: UIStackView = {
    let stack = UIStackView()
    stack.axis = .vertical
    stack.spacing = 4
    return stack
  }()
  
  let descStackView: UIStackView = {
    let stack = UIStackView()
    stack.axis = .vertical
    stack.spacing = 8
    return stack
  }()
  
  let data: ProtocolHotCoffee
  init(data: ProtocolHotCoffee) {
    self.data = data
    super.init(nibName: nil, bundle: nil)
  }
  
  lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    
    return scrollView
  }()
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  static let reuseIndentifier = "detailOfCoffee"
    override func viewDidLoad() {
        super.viewDidLoad()
    
      configView()
      
    }
  
  override func viewWillAppear(_ animated: Bool) {
    navigationController?.navigationBar.isHidden = false
  }
  
  func configView() {
    backgroudColor()
    addSubView()
    setupView()
    setupConstraint()
  }
  
  func addSubView() {
    view.addSubview(scrollView)
    scrollView.addSubview(containerView)
    containerView.addSubview(detailImage)
    containerView.addSubview(containerLabel)
    
    containerLabel.addSubview(stackView)
    
    titleStackView.addArrangedSubview(textLabel)
    titleStackView.addArrangedSubview(priceLabel)
    
    descStackView.addArrangedSubview(descriptionLabel)
    descStackView.addArrangedSubview(desclabel)
    
    stackView.addArrangedSubview(titleStackView)
    stackView.addArrangedSubview(descStackView)
    
  }
  
  func backgroudColor() {
    view.backgroundColor = .gray
  }
  
  func setupView() {
    detailImage.loadImage(resource: data.photoUrlString)
    textLabel.text = data.name
    priceLabel.text = "Rp. \(data.price)"
    descriptionLabel.text = "Description:"
    desclabel.text = data.descCoffee
  }
  
  func setupConstraint() {
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    
    containerView.translatesAutoresizingMaskIntoConstraints = false
    containerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
    containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
    containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
    containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    
    detailImage.translatesAutoresizingMaskIntoConstraints = false
    detailImage.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
    detailImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
    detailImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
    detailImage.heightAnchor.constraint(equalToConstant: 400).isActive = true
    
    containerLabel.translatesAutoresizingMaskIntoConstraints = false
    containerLabel.topAnchor.constraint(equalTo: detailImage.bottomAnchor, constant: -20).isActive = true
    containerLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
    containerLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
    containerLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -32).isActive = true
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.topAnchor.constraint(equalTo: containerLabel.topAnchor, constant: 32).isActive = true
    stackView.leadingAnchor.constraint(equalTo: containerLabel.leadingAnchor, constant: 16).isActive = true
    stackView.trailingAnchor.constraint(equalTo: containerLabel.trailingAnchor, constant: -16).isActive = true
    stackView.bottomAnchor.constraint(equalTo: containerLabel.bottomAnchor, constant: -32).isActive = true
    
    stackView.backgroundColor = .green
  }

}
