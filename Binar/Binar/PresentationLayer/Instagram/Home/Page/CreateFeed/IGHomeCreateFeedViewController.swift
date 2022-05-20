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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.viewWillDisappear()
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
                cell.content.contentMode = .scaleAspectFit
                cell.content.clipsToBounds = true
                cell.content.backgroundColor = .systemGray
                
                _self.newFeedImageView = cell.content
                
                var imageViewHeight: CGFloat = _self.view.frame.height / 2
                let isFirstTimeLoaded = _self.feedImageCellHeight == 0
                if isFirstTimeLoaded {
                    _self.feedImageCellHeight = imageViewHeight
                } else {
                    imageViewHeight = _self.feedImageCellHeight
                }
                
                if let imageUrl = _self.viewModel.viewParam.imageUrl,
                   let imageData = try? Data(contentsOf: imageUrl),
                   let image = UIImage(data: imageData) {
                    
                    cell.content.image = image
                    
                    let screenWidth: CGFloat = _self.view.frame.width
                    let imageHeight: CGFloat = image.heightWithRatio(inWidth: screenWidth)
                    imageViewHeight = imageHeight
                    _self.feedImageCellHeight = imageHeight
                }
                
                cell.setHeight(imageViewHeight)
            }.onSelectCell { [weak self] _, _ in
                self?.viewModel.onImageViewTap()
            }
            loadCell { [weak self] (cell: TableCell<UITextField>, _) in
                guard let _self = self else { return }
                cell.padding = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
                cell.content.placeholder = "Write your caption here"
                cell.content.addTarget(
                    self,
                    action: #selector(_self.onCaptionTextFieldChanged),
                    for: .editingChanged
                )
                let caption: String = _self.viewModel.viewParam.caption
                cell.content.text = caption
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
    
    @objc private func onCaptionTextFieldChanged(_ textField: UITextField) {
        let text: String = textField.text ?? ""
        viewModel.onCaptionTextChange(text: text)
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
        let screenWidth: CGFloat = view.frame.width
        let imageHeight: CGFloat = image.heightWithRatio(inWidth: screenWidth)
        
        feedImageCellHeight = imageHeight
        newFeedImageView?.image = image
        
        reloadTableView()
    }
}

extension UIImage {
    func heightWithRatio(_ ratio: CGFloat? = nil, inWidth width: CGFloat) -> CGFloat {
        var imageRatio: CGFloat = size.width / size.height
        if let ratio = ratio {
            imageRatio = ratio
        }
        var res: CGFloat = width / imageRatio
        res = ceil(res)
        return res
    }
}
