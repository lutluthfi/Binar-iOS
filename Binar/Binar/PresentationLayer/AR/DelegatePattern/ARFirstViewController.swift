//
//  ARFirstViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 31/03/22.
//

import UIKit

final class ARFirstViewController: UIViewController {
    lazy var studentNameLabel: UILabel = {
        let view = UILabel()
        view.text = "Student Name"
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupAddSubview()
        setupConstraint()
        setupView()
    }
    
    private func setupAddSubview() {
        view.addSubview(studentNameLabel)
    }
    
    private func setupConstraint() {
        studentNameLabel.makeConstraint { view in
            [view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             view.centerYAnchor.constraint(equalTo: view.centerYAnchor)]
        }
    }
    
    private func setupNavigationBar() {
        let addButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(onAddButtonTap)
        )
        navigationItem.rightBarButtonItems = [addButton]
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    @objc private func onAddButtonTap(_ sender: UIBarButtonItem) {
        let viewController = ARSecondViewController()
        viewController.didSelectStudent = { [weak self] student in
            self?.studentNameLabel.text = student.name
        }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
