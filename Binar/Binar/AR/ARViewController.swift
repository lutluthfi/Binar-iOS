//
//  ARViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 14/03/22.
//

import UIKit

final class ARViewController: UIViewController, StoryboardInstantiable {
    @IBOutlet weak var alertButton: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var firstStackViewLabel: UILabel!
    @IBOutlet weak var stepperValueLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
        setupToolbar()
        setupPosterImageView()
    }
    
    @IBAction func onAlertButtonTap(_ sender: UIButton) {
        let alertController = UIAlertController(
            title: "Alert",
            message: "This is message's alert",
            preferredStyle: .alert
        )
        
        alertController.addTextField { textField in
            textField.placeholder = "Search"
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive)
        alertController.addAction(cancel)
        
        let confirm = UIAlertAction(title: "Confirm", style: .default) { action in
            guard alertController.textFields?.isEmpty == false else { return }
            let textField: UITextField? = alertController.textFields?[0]
            guard let _textField = textField else { return }
            let text: String? = _textField.text
            self.textLabel.text = text
        }
        alertController.addAction(confirm)
        
        present(alertController, animated: true)
    }
    
    @IBAction func onSegmentValueChanged(_ sender: UISegmentedControl) {
        let selectedIndex: Int = sender.selectedSegmentIndex
        let selectedImage: UIImage? = sender.imageForSegment(at: selectedIndex)
        let selectedTitle: String? = sender.titleForSegment(at: selectedIndex)
        
        if let selectedImage = selectedImage {
            alertButton.setImage(selectedImage, for: .normal)
        }
        if let selectedTitle = selectedTitle {
            alertButton.setTitle(selectedTitle, for: .normal)
        }
    }
    
    @IBAction func onStepperValueChanged(_ sender: UIStepper) {
        let stepperValue = String(Int(sender.value))
        stepperValueLabel.text = stepperValue
    }
    
    @objc func onFilterBarButtonTap(_ sender: UIBarButtonItem) {
        textLabel.isHidden.toggle()
        firstStackViewLabel.isHidden.toggle()
    }
    
    @objc func onSortBarButtonTap(_ sender: UIBarButtonItem) {
    }
    
    @objc func onAddBarButtonItemTap(_ sender: UIBarButtonItem) {
        print("onAddBarButtonItemTap")
    }
    
    private func setupToolbar() {
        navigationController?.isToolbarHidden = false
        let filterBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "line.3.horizontal.decrease.circle"),
            style: .plain,
            target: self,
            action: #selector(onFilterBarButtonTap)
        )
        let sortBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "arrow.up.arrow.down.circle"),
            style: .plain,
            target: self,
            action: #selector(onSortBarButtonTap)
        )
        let flexibleBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        toolbarItems = [
            filterBarButtonItem,
            flexibleBarButtonItem,
            sortBarButtonItem
        ]
    }
    
    private func setupNavigationItem() {
        navigationItem.title = name
        
        let addBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(onAddBarButtonItemTap)
        )
        navigationItem.rightBarButtonItems = [addBarButtonItem]
    }
    
    private func setupPosterImageView() {
        let imageUrlString = "https://locate.apple.com/resources/images/widgets/sales_locator_long_2x.jpg"
        guard let url = URL(string: imageUrlString) else {
            print("Failed to load image")
            return
        }
        
//        Materi Raja Terakhir
//        DispatchQueue.global(qos: .background).async {
//            if let data = try? Data(contentsOf: url) {
//                DispatchQueue.main.async {
//                    self.posterImageView.image = UIImage(data: data)
//                }
//            } else {
//                self.posterImageView.image = UIImage(systemName: "photo.fill")
//            }
//        }
        
        if let data = try? Data(contentsOf: url) {
            posterImageView.image = UIImage(data: data)
        } else {
            posterImageView.image = UIImage(systemName: "photo.fill")
        }
    }
}
