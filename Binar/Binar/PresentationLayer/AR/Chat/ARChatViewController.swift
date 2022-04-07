//
//  ARChatViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 04/04/22.
//

import UIKit

final class ARChatViewController: UIViewController {
    lazy var tableView: UITableView = makeTableView()
    lazy var inputTextView = ARChatInputTextView()
    lazy var backgroundInputTextView: UIVisualEffectView = .makeBlur(for: .light)
    
    private var bottomInputTextViewConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddSubview()
        setupConstraint()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        enableKeyboardNotification()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardNotification()
    }
    
    private func setupAddSubview() {
        view.addSubview(tableView)
        view.addSubview(backgroundInputTextView)
        view.addSubview(inputTextView)
    }
    
    private func setupConstraint() {
        let safeAreaLayout: UILayoutGuide = self.view.safeAreaLayoutGuide
        tableView.makeConstraint {
            [$0.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor),
             $0.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor),
             $0.topAnchor.constraint(equalTo: self.view.topAnchor),
             $0.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)]
        }
        backgroundInputTextView.makeConstraint {
            [$0.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor),
             $0.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor),
             $0.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
             $0.topAnchor.constraint(equalTo: self.inputTextView.topAnchor)]
        }
        inputTextView.makeConstraint {
            self.bottomInputTextViewConstraint = $0.bottomAnchor.constraint(
                equalTo: safeAreaLayout.bottomAnchor
            )
            return [
                $0.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor),
                $0.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor),
                self.bottomInputTextViewConstraint
            ]
        }
    }
    
    private func setupView() {
        enableHideKeyboardGesture()
    }
    
    override func keyboardWillShow(_ notification: Notification, keyboardFrame: CGRect) {
        let bottomInset: CGFloat = view.safeAreaInsets.bottom
        self.bottomInputTextViewConstraint.constant = -(keyboardFrame.height - bottomInset)
        UIView.animate(withDuration: 0.05) {
            self.view.layoutIfNeeded()
        }
    }
    
    override func keyboardWillHide(_ notification: Notification) {
        self.bottomInputTextViewConstraint.constant = 0
        UIView.animate(withDuration: 0.05) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func makeTableView() -> UITableView {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        view.registerCell(UITableViewCell.self)
        return view
    }
}

extension ARChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reusableCell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let row: Int = indexPath.row
        reusableCell.textLabel?.text = "Row: \(row)"
        
        return reusableCell
    }
}

extension ARChatViewController: UITableViewDelegate {
    
}
