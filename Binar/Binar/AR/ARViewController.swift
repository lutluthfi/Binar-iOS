//
//  ARViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 14/03/22.
//

import UIKit

final class ARViewController: UIViewController, StoryboardInstantiable {
    lazy var alertButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Alert Button", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .systemBlue
        view.addTarget(self, action: #selector(onAlertButtonTap), for: .touchUpInside)
        view.rounded(cornerRadius: 8)
        return view
    }()
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.alwaysBounceVertical = true
        view.showsVerticalScrollIndicator = true
        return view
    }()
    lazy var contentView: UIView = UIView()
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var firstStackViewLabel: UILabel!
    @IBOutlet weak var stepperValueLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    private let name: String
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(name: String) {
        self.name = name
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddView()
        setupConstraint()
        viewDidLoadPreparation()
    }
    
    func setupAddView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(alertButton)
    }
    
    func setupConstraint() {
        scrollView.makeConstraint(
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        )
        let contentHeightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        contentHeightConstraint.priority = .defaultLow
        let contentWidthConstraint = contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
//        contentWidthConstraint.priority = .defaultLow
        contentView.makeConstraint(
            contentHeightConstraint,
            contentWidthConstraint,
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        )
        alertButton.makeConstraint(
            alertButton.heightAnchor.constraint(equalToConstant: 44),
            alertButton.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 16),
            alertButton.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 16),
            alertButton.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -16)
        )
    }
    
    func viewDidLoadPreparation() {
        title = name
        view.backgroundColor = .white
    }
    
    @objc func onAlertButtonTap(_ sender: UIButton) {
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
        posterImageView.loadImage(resource: imageUrlString)
    }
}
