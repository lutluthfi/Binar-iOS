//
//  IGHomeCreateFeedViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 17/05/22.
//

import MobileCoreServices
import UIKit

final class IGHomeCreateFeedViewController: UIViewController {
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.backgroundColor = .systemGray
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onImageViewTap))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGesture)
        return view
    }()
    lazy var captionTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Write your caption here"
        return view
    }()
    
    private var heightImageViewConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddSubview()
        setupConstraint()
        setupNavBar()
        setupView()
    }
    
    private func setupAddSubview() {
        view.addSubview(imageView)
        view.addSubview(captionTextField)
    }
    
    private func setupConstraint() {
        let imageViewHeight: CGFloat = view.frame.height / 2
        heightImageViewConstraint = imageView.heightAnchor.constraint(equalToConstant: imageViewHeight)
        imageView.makeConstraint(builder: {
            $0.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
            $0.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
            heightImageViewConstraint!
        })
        captionTextField.makeConstraint(builder: {
            $0.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
            $0.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
            $0.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20)
        })
    }
    
    private func setupNavBar() {
        let nextBarButton = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(onNextBarButtonTap))
        navigationController?.navigationItem.rightBarButtonItems = [nextBarButton]
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    @objc private func onNextBarButtonTap() {
        print("Next")
    }
    
    @objc private func onImageViewTap() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.mediaTypes = [String(kUTTypeImage), String(kUTTypeMovie)]
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true)
    }
}

extension IGHomeCreateFeedViewController: UINavigationControllerDelegate {
}

extension IGHomeCreateFeedViewController: UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        picker.dismiss(animated: true) { [weak self] in
            self?.didImagePickerControllerDismiss(image: image)
        }
    }
    
    private func didImagePickerControllerDismiss(image: UIImage) {
        let imageRatio: CGFloat = image.size.width / image.size.height
        var imageHeight: CGFloat = view.frame.width / imageRatio
        imageHeight = ceil(imageHeight)
        
        heightImageViewConstraint?.constant = imageHeight
        imageView.image = image
        
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
}
