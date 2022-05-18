//
//  IGHomeCreateFeedViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 17/05/22.
//

import MobileCoreServices
import UIKit

final class IGHomeCreateFeedViewController: LiteTableViewController {
    private(set) weak var newFeedImageView: UIImageView?
    
    private(set) var feedImageCellHeight: CGFloat = 0
    
    let viewModel = IGHomeCreateFeedViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupNavBar()
        setupView()
    }
    
    private func setupNavBar() {
        let cancelBarButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(onCancelBarButtonTap))
        let nextBarButton = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(onNextBarButtonTap))
        navigationItem.title = "Create Feed"
        navigationItem.leftBarButtonItem = cancelBarButton
        navigationItem.rightBarButtonItem = nextBarButton
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        loadTableView {
            loadCell { [weak self] (cell: TableCell<UIImageView>, _) in
                guard let _self = self else { return }
                _self.newFeedImageView = cell.content
                
                var imageViewHeight: CGFloat = _self.view.frame.height / 2
                let isFirstTimeLoaded = _self.feedImageCellHeight == 0
                if isFirstTimeLoaded {
                    _self.feedImageCellHeight = imageViewHeight
                } else {
                    imageViewHeight = _self.feedImageCellHeight
                }
                
                cell.setHeight(imageViewHeight)
                cell.content.contentMode = .scaleAspectFit
                cell.content.clipsToBounds = true
                cell.content.backgroundColor = .systemGray
            }.onSelectCell { [weak self] _, _ in
                self?.viewModel.onImageViewTap()
            }
            loadCell { (cell: TableCell<UITextField>, _) in
                cell.padding = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
                cell.content.placeholder = "Write your caption here"
            }
        }
    }
    
    private func setupViewModel() {
        viewModel.onRouterChanged = { [weak self] router in
            switch router {
            case .dismiss:
                self?.dismiss(animated: true)
            case .openImagePicker:
                let pickerController = UIImagePickerController()
                pickerController.delegate = self
                pickerController.allowsEditing = true
                pickerController.mediaTypes = [String(kUTTypeImage), String(kUTTypeMovie)]
                pickerController.sourceType = .photoLibrary
                self?.present(pickerController, animated: true)
            }
        }
    }
    
    @objc private func onCancelBarButtonTap() {
        viewModel.onCancelBarButtonTap()
    }
    
    @objc private func onNextBarButtonTap() {
        viewModel.onNextBarButtonTap()
    }
    
    @objc private func onImageViewTap() {
        viewModel.onImageViewTap()
    }
}

extension IGHomeCreateFeedViewController: UINavigationControllerDelegate {
}

extension IGHomeCreateFeedViewController: UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
        guard let image = info[.editedImage] as? UIImage,
              let imageUrl = info[.imageURL] as? URL
        else { return }
        
        print(">>> imageUrl: \(imageUrl)")
        
        viewModel.onImagePickerFinish(with: imageUrl)
        
        picker.dismiss(animated: true) { [weak self] in
            self?.onImagePickerFinish(image: image)
        }
    }
    
    private func onImagePickerFinish(image: UIImage) {
        let imageRatio: CGFloat = image.size.width / image.size.height
        var imageHeight: CGFloat = view.frame.width / imageRatio
        imageHeight = ceil(imageHeight)
        
        feedImageCellHeight = imageHeight
        newFeedImageView?.image = image
        
        reloadTableView()
    }
}

extension IGHomeCreateFeedViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let text = textField.text ?? ""
        print(">>> text: \(text)")
        
        return true
    }
}
