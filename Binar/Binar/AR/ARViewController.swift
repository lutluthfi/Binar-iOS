//
//  ARViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 14/03/22.
//

import UIKit

final class ARViewController: UIViewController {
    @IBOutlet weak var alertButton: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
    }
    
    @IBAction func onAlertButtonTap(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Alert", message: "This is message's alert", preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "Search"
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive)
        alertController.addAction(cancel)
        
        let confirm = UIAlertAction(title: "Confirm", style: .default) { action in
            guard alertController.textFields?.isEmpty == false else { return }
            let textField: UITextField? = alertController.textFields?[0]
            guard let textField = textField else { return }
            let text: String? = textField.text
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
    
    @objc func onAddBarButtonItemTap(_ sender: UIBarButtonItem) {
        print("onAddBarButtonItemTap")
    }
    
    private func setupNavigationItem() {
        navigationItem.title = name
        
        let addBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(onAddBarButtonItemTap)
        )
        navigationItem.leftBarButtonItems = [addBarButtonItem]
    }
}
