//
//  ARFormViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 01/04/22.
//

import UIKit

struct FormSection {
    let titleText: String?
    let footerText: String?
    let formTypes: [FormType]
    
    init(titleText: String? = nil, footerText: String? = nil, formTypes: [FormType]) {
        self.titleText = titleText
        self.footerText = footerText
        self.formTypes = formTypes
    }
}

enum FormType {
    case textField(ARFormTextFieldTableCell.UIState)
    case textView
}

final class ARFormViewController: UITableViewController {
    lazy var rectangleView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    private var bottomRectangleViewConstraint: NSLayoutConstraint?
    
    private var formSections: [FormSection] = []
    private lazy var nameSection: FormSection = {
        let firstNameType: FormType = .textField(
            ARFormTextFieldTableCell.UIState(placeholder: "First Name")
        )
        let lastNameType: FormType = .textField(
            ARFormTextFieldTableCell.UIState(placeholder: "Last Name")
        )
        let section = FormSection(
            titleText: "Person Name",
            formTypes: [firstNameType, lastNameType]
        )
        return section
    }()
    private lazy var dobSection: FormSection = {
        let dobType: FormType = .textField(
            ARFormTextFieldTableCell.UIState(placeholder: "Date of Birth", type: .date())
        )
        let section = FormSection(
            titleText: "Date of Birth",
            formTypes: [dobType]
        )
        return section
    }()
    
    override func loadView() {
        let frame: CGRect = UIScreen.main.bounds
        tableView = UITableView(frame: frame, style: .grouped)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enableHideKeyboardGesture()
        setupAddSubview()
        setupConstraint()
        setupTableView()
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
        view.addSubview(rectangleView)
    }
    
    private func setupConstraint() {
        rectangleView.makeConstraint { view in
            self.bottomRectangleViewConstraint = view.bottomAnchor.constraint(
                equalTo: self.view.safeAreaLayoutGuide.bottomAnchor
            )
            return [view.heightAnchor.constraint(equalToConstant: 44),
                    view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
                    view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
                    self.bottomRectangleViewConstraint!]
        }
    }
    
    private func setupTableView() {
        tableView.registerCell(ARFormTextFieldTableCell.self)
        tableView.keyboardDismissMode = .onDrag
        
        formSections = [nameSection, dobSection]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        formSections.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        let numberOfFormTypes: Int = formSections[section].formTypes.count
        return numberOfFormTypes
    }
    
    override func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        let formSection: FormSection = formSections[section]
        return formSection.titleText
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let section: Int = indexPath.section
        let row: Int = indexPath.row
        
        let formType: FormType = formSections[section].formTypes[row]
        switch formType {
        case let .textField(state):
            return dequeueTextFieldCell(state: state, in: tableView, at: indexPath)
        case .textView:
            return dequeueTextViewCell(in: tableView, at: indexPath)
        }
    }
    
    private func dequeueTextFieldCell(
        state: ARFormTextFieldTableCell.UIState,
        in tableView: UITableView,
        at indexPath: IndexPath
    ) -> ARFormTextFieldTableCell {
        let reusableCell: UITableViewCell = tableView.dequeueReusableCell(
            withIdentifier: "ARFormTextFieldTableCell",
            for: indexPath
        )
        guard let cell = reusableCell as? ARFormTextFieldTableCell else {
            fatalError("Cannot dequeueReusableCell \(ARFormTextFieldTableCell.self)")
        }
        
        cell.configure(state)
        cell.margin = UIEdgeInsets(top: 4, left: 20, bottom: -4, right: -4)
        cell.height = 32
        
        return cell
    }
    
    private func dequeueTextViewCell(
        in tableView: UITableView,
        at indexPath: IndexPath
    ) -> ARFormTextViewTableCell {
        let reusableCell: UITableViewCell = tableView.dequeueReusableCell(
            withIdentifier: "ARFormTextViewTableCell",
            for: indexPath
        )
        guard let cell = reusableCell as? ARFormTextViewTableCell else {
            fatalError("Cannot dequeueReusableCell \(ARFormTextViewTableCell.self)")
        }
        
        
        
        return cell
    }
    
    override func keyboardWillShow(_ notification: Notification, keyboardFrame: CGRect) {
        let keyboardHeight: CGFloat = keyboardFrame.height
        
        let bottomInset: CGFloat = view.safeAreaInsets.bottom
        bottomRectangleViewConstraint?.constant = -(keyboardHeight - bottomInset)
        UIView.animate(withDuration: 0.05) {
            self.view.layoutIfNeeded()
        }
    }
    
    override func keyboardWillHide(_ notification: Notification) {
        bottomRectangleViewConstraint?.constant = 0
        UIView.animate(withDuration: 0.05) {
            self.view.layoutIfNeeded()
        }
    }
}
