//
//  AFDetailViewController.swift
//  Binar
//
//  Created by Adji Firmansyah on 3/25/22.
//

import UIKit

class AFDetailViewController: UIViewController {
  private let animal: Animal
  private let bgColor: UIColor
  lazy var nameOfAnimal = UILabel()
  lazy var typeOfFood = UILabel()
  lazy var strengthLabel = UILabel()
  lazy var descLabel = UILabel()
  lazy var descOfAnimal = UILabel()
  lazy var bgOfImage = UIView()
  lazy var imageOfAnimal = UIImageView()
  
  lazy var mainView = UIView()
  lazy var scrollView = UIScrollView()
  lazy var stackView = UIStackView()
  lazy var titleStackView = UIStackView()
  lazy var descStackView = UIStackView()
  lazy var labelStackView = UIStackView()
  
  init(animal: Animal, bg: UIColor) {
    self.animal = animal
    bgColor = bg
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    setupLayout()
  }
  
  func setupLayout() {
    setupScrollView()
    setupImage()
    setupLabel()
    setupStackView()
    setContraint()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    navigationController?.navigationBar.prefersLargeTitles = !animated
  }
  
  private func setupLabel() {
    nameOfAnimal.text      = animal.name
    nameOfAnimal.font      = .systemFont(ofSize: 18, weight: .bold)
    nameOfAnimal.textColor = .black
    
    descLabel.text = "Description :"
    descLabel.font = .systemFont(ofSize: 12, weight: .bold)
    descLabel.textColor = .black

    descOfAnimal.text          = animal.description
    descOfAnimal.font          = .systemFont(ofSize: 12)
    descOfAnimal.textColor     = .gray
    descOfAnimal.numberOfLines = 0

    typeOfFood.text          = animal.typeOfFood.rawValue.capitalized
    typeOfFood.font          = .systemFont(ofSize: 12)
    typeOfFood.textColor     = .gray
    typeOfFood.numberOfLines = 0
    
    strengthLabel.text          = "\(animal.strength)"
    strengthLabel.font          = .systemFont(ofSize: 12, weight: .bold)
    strengthLabel.textColor     = .black
//    strengthLabel.layer.opacity =
    strengthLabel.numberOfLines = 0
    strengthLabel.textAlignment = .center
    strengthLabel.backgroundColor = bgOfImage.backgroundColor
    
    strengthLabel.layer.cornerRadius = 8
    strengthLabel.layer.masksToBounds = true
    
    mainView.addSubview(descLabel)
    mainView.addSubview(descOfAnimal)
  }
  
  private func setupImage() {
    imageOfAnimal.loadImage(resource: animal.photoUrlString)
    imageOfAnimal.contentMode = .scaleAspectFit
    
    bgOfImage.backgroundColor = bgColor
    bgOfImage.addSubview(imageOfAnimal)
  }
  
  private func setupScrollView() {
    view.addSubview(scrollView)
    scrollView.addSubview(mainView)
    mainView.addSubview(bgOfImage)
  }
  
  private func setupStackView() {
    stackView.axis         = .horizontal
    stackView.spacing      = 16
    
    titleStackView.axis    = .vertical
    titleStackView.spacing = 0
    
    titleStackView.addArrangedSubview(typeOfFood)
    titleStackView.addArrangedSubview(nameOfAnimal)
    
    stackView.addArrangedSubview(titleStackView)
    stackView.addArrangedSubview(strengthLabel)
    
    mainView.addSubview(stackView)
  }
  
  
  func setContraint() {
    scrollView.translatesAutoresizingMaskIntoConstraints                      = false
    scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    scrollView.topAnchor.constraint(equalTo:     view.topAnchor).isActive     = true
    scrollView.bottomAnchor.constraint(equalTo:  view.bottomAnchor).isActive  = true
    scrollView.widthAnchor.constraint(equalTo:   view.widthAnchor).isActive   = true
    
    mainView.translatesAutoresizingMaskIntoConstraints                              = false
    mainView.topAnchor.constraint(equalTo:      scrollView.topAnchor).isActive      = true
    mainView.leadingAnchor.constraint(equalTo:  scrollView.leadingAnchor).isActive  = true
    mainView.bottomAnchor.constraint(equalTo:   scrollView.bottomAnchor).isActive   = true
    mainView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
    mainView.widthAnchor.constraint(equalTo:    scrollView.widthAnchor).isActive    = true
    
    stackView.translatesAutoresizingMaskIntoConstraints                                           = false
    stackView.topAnchor.constraint(equalTo:      bgOfImage.bottomAnchor, constant: 8).isActive    = true
    stackView.leadingAnchor.constraint(equalTo:  mainView.leadingAnchor, constant: 16).isActive   = true
    stackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16).isActive = true

    strengthLabel.translatesAutoresizingMaskIntoConstraints            = false
    strengthLabel.widthAnchor.constraint(equalToConstant: 34).isActive = true
    
    descLabel.translatesAutoresizingMaskIntoConstraints                                           = false
    descLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 32).isActive        = true
    descLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16).isActive    = true
    descLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16).isActive = true
    
    descOfAnimal.translatesAutoresizingMaskIntoConstraints                                           = false
    descOfAnimal.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 8 ).isActive        = true
    descOfAnimal.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16).isActive    = true
    descOfAnimal.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16).isActive = true
    descOfAnimal.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -16).isActive     = true
    
    bgOfImage.translatesAutoresizingMaskIntoConstraints                            = false
    bgOfImage.topAnchor.constraint(equalTo:      mainView.topAnchor).isActive      = true
    bgOfImage.leadingAnchor.constraint(equalTo:  mainView.leadingAnchor).isActive  = true
    bgOfImage.trailingAnchor.constraint(equalTo: mainView.trailingAnchor).isActive = true
    bgOfImage.heightAnchor.constraint(equalToConstant: 180).isActive               = true
    
    imageOfAnimal.translatesAutoresizingMaskIntoConstraints                           = false
    imageOfAnimal.bottomAnchor.constraint(equalTo:  bgOfImage.bottomAnchor).isActive  = true
    imageOfAnimal.centerXAnchor.constraint(equalTo: bgOfImage.centerXAnchor).isActive = true
    imageOfAnimal.heightAnchor.constraint(equalToConstant: 160).isActive              = true
    
  }
  
}
