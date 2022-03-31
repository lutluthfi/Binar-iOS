//
//  ARFirstViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 31/03/22.
//

import UIKit

// 1. buat label di main page ✅
// 2. navigate main page ke second page ✅
// 3. tampilin data table di second page ✅
// 4. bikin feature selection dan save/done di second page ✅
// 5. tampilin data yang dipilih dari second page di main page

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
        studentNameLabel.makeConstraint(
            studentNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            studentNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        )
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
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ARFirstViewController: ARSecondViewControllerDelegate {
    func secondViewController(
        _ viewController: ARSecondViewController,
        didSelectStudent student: Student
    ) {
        studentNameLabel.text = student.name
    }
}
