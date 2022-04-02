//
//  AFChallengeBinarViewController.swift
//  Binar
//
//  Created by Adji Firmansyah on 3/26/22.
//

import UIKit

class AFChallengeBinarViewController: UIViewController {
  let firstTextField = UITextField()
  let secondTextField = UITextField()
  let resButton = UIButton()
  let stackView = UIStackView()
  let stackViewResultCalculate = UIStackView()
  
  let resultLabel = UILabel()
  let resultTitleLabel = UILabel()
  
  let imageView = UIImageView()
  let additionImageView = UIImageView()
  
  var result: Int = 0
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
    
  }
  
  func setupView() {
    view.backgroundColor = .white
    
    setupDelegate()
    setupTextField()
    setupStackView()

    resultTitleLabel.text = "Result"
    setupLabel(label: resultTitleLabel)
    
    additionImageView.image = UIImage(systemName: "plus")
    additionImageView.contentMode = .scaleAspectFit
    imageView.contentMode = .scaleAspectFill
    
    view.addSubview(imageView)
    
    setupButton()
    setupConstraint()
    
  }
  
  func setupLabel(label: UILabel) {
    label.textColor = .black
    label.font = .systemFont(ofSize: 24, weight: .bold)
  }
  
  func setupDelegate() {
    firstTextField.delegate = self
    secondTextField.delegate = self
  }
  
  func setupTextField() {
    let placeholder = firstTextField.placeholder ?? "Type your number"
    
    firstTextField.textColor = .black
    firstTextField.borderStyle = .roundedRect
    firstTextField.backgroundColor = .white
    firstTextField.keyboardType = .numberPad
    secondTextField.autocorrectionType = .no
    firstTextField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
    
    secondTextField.textColor = .black
    secondTextField.borderStyle = .roundedRect
    secondTextField.backgroundColor = .white
    secondTextField.keyboardType = .numberPad
    secondTextField.autocorrectionType = .no
    secondTextField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
    
  }
  
  func setupStackView() {
    stackView.axis = .horizontal
//    stackView.alignment = .leading
    stackView.spacing = 32
    stackView.distribution = .fillProportionally
    
    
    stackView.addArrangedSubview(firstTextField)
    stackView.addArrangedSubview(additionImageView)
    stackView.addArrangedSubview(secondTextField)
    
    stackViewResultCalculate.axis = .horizontal
//    stackViewResultCalculate.alignment = .leading
    stackViewResultCalculate.spacing = 32
    
    
    stackViewResultCalculate.addArrangedSubview(resultTitleLabel)
    stackViewResultCalculate.addArrangedSubview(resultLabel)
    
    view.addSubview(stackView)
    view.addSubview(stackViewResultCalculate)
  }
  
  func setupButton() {
    resButton.setTitle("Calculate", for: .normal)
    resButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
    resButton.backgroundColor = .blue
    view.addSubview(resButton)
  }
  
  @objc func calculate() {
    guard let firstValue = Int(firstTextField.text ?? "") else { return }
    guard let secondValue = Int(secondTextField.text ?? "") else { return }
    result = firstValue + secondValue
    
    resultLabel.text = String(result)
    setupLabel(label: resultLabel)
    
    let image1 = UIImage(systemName: "suit.heart")
    let image2 = UIImage(systemName: "suit.club")
    let image3 = UIImage(systemName: "suit.spade")
    guard let randomImage = [image1, image2, image3].randomElement() else { return }
    
    imageView.image = randomImage
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    navigationItem.searchController = nil
    navigationItem.title = "Binar Challenge Chapter 3 "
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    print("viewWillDisappear")
  }
  
  func setupConstraint() {
    let safeLayout = view.safeAreaLayoutGuide
    resButton.translatesAutoresizingMaskIntoConstraints                                                    = false
    resButton.centerXAnchor.constraint(equalTo: safeLayout.centerXAnchor).isActive                         = true
    resButton.topAnchor.constraint(equalTo: stackViewResultCalculate.bottomAnchor, constant: 32).isActive  = true
    resButton.widthAnchor.constraint(equalToConstant: 100).isActive                                        = true
    
//    firstTextField.translatesAutoresizingMaskIntoConstraints                                               = false
//    secondTextField.translatesAutoresizingMaskIntoConstraints                                              = false
    
//    firstTextField.heightAnchor.constraint(equalToConstant: 32).isActive                                   = true
//    secondTextField.heightAnchor.constraint(equalToConstant: 32).isActive                                  = true
    
    stackView.translatesAutoresizingMaskIntoConstraints                                                    = false
    stackView.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 64).isActive                   = true
    stackView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 16).isActive           = true
    stackView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: -16).isActive        = true
//    stackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    stackViewResultCalculate.translatesAutoresizingMaskIntoConstraints                                    = false
    stackViewResultCalculate.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16).isActive = true
    stackViewResultCalculate.centerXAnchor.constraint(equalTo: safeLayout.centerXAnchor).isActive         = true
    
    additionImageView.translatesAutoresizingMaskIntoConstraints                                           = false
    additionImageView.widthAnchor.constraint(equalToConstant: 16).isActive                                = true
    
    imageView.translatesAutoresizingMaskIntoConstraints                                                   = false
    imageView.topAnchor.constraint(equalTo: resButton.bottomAnchor, constant: 16).isActive                = true
    imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                              = true
    imageView.heightAnchor.constraint(equalToConstant: 100).isActive                                      = true
    imageView.widthAnchor.constraint(equalToConstant: 100).isActive                                      = true
    
  }
  
}

extension AFChallengeBinarViewController: UITextFieldDelegate {
  func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
    view.endEditing(true)
  }
  
  
}
