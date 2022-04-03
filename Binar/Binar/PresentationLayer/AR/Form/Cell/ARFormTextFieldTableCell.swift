//
//  ARFormTextFieldTableCell.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 01/04/22.
//

import UIKit

enum KeyboardType {
    case text(String? = nil)
    case date(Date? = nil)
    case time(Date? = nil)
}

final class ARFormTextFieldTableCell: UITableViewCell {
    final class UIState {
        var color: UIColor = .darkText
        var font: UIFont?
        var placeholder: String = ""
        var type: KeyboardType = .text(nil)
        
        init(
            color: UIColor = .darkText,
            font: UIFont? = nil,
            placeholder: String = "",
            type: KeyboardType = .text(nil)
        ) {
            self.color = color
            self.font = font
            self.placeholder = placeholder
            self.type = type
        }
    }
    
    lazy var textField: UITextField = UITextField()
    
    var height: CGFloat? {
        didSet { updateHeightConstraint() }
    }
    var margin = UIEdgeInsets(top: 4, left: 8, bottom: -4, right: -8) {
        didSet { updateMarginConstraint() }
    }
    
    private var heightConstraint: NSLayoutConstraint?
    private var leadingConstraint: NSLayoutConstraint!
    private var topConstraint: NSLayoutConstraint!
    private var trailingConstraint: NSLayoutConstraint!
    private var bottomConstraint: NSLayoutConstraint!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupAddSubview()
        setupConstraint()
        setupView()
    }
    
    private func setupAddSubview() {
        contentView.addSubview(textField)
    }
    
    private func setupConstraint() {
        textField.makeConstraint { view in
            self.leadingConstraint = view.leadingAnchor.constraint(
                equalTo: self.contentView.leadingAnchor,
                constant: self.margin.left
            )
            self.topConstraint = view.topAnchor.constraint(
                equalTo: self.contentView.topAnchor,
                constant: self.margin.top
            )
            self.trailingConstraint = view.trailingAnchor.constraint(
                equalTo: self.contentView.trailingAnchor,
                constant: self.margin.right
            )
            self.bottomConstraint = view.bottomAnchor.constraint(
                equalTo: self.contentView.bottomAnchor,
                constant: self.margin.bottom
            )
            return [self.leadingConstraint, self.topConstraint,
                    self.trailingConstraint, self.bottomConstraint]
        }
    }
    
    private func setupView() {
//        textField.layer.cornerRadius = 8
//        textField.layer.borderColor = UIColor.systemBlue.cgColor
//        textField.layer.borderWidth = 1.0
    }
    
    private func updateMarginConstraint() {
        self.leadingConstraint.constant = margin.left
        self.trailingConstraint.constant = margin.right
        self.topConstraint.constant = margin.top
        self.bottomConstraint.constant = margin.bottom
    }
    
    private func updateHeightConstraint() {
        guard let height = height else {
            return
        }
        if heightConstraint == nil {
            heightConstraint = textField.heightAnchor.constraint(greaterThanOrEqualToConstant: height)
            heightConstraint?.isActive = true
        } else {
            heightConstraint?.constant = height
        }
    }
    
    func configure(_ state: UIState) {
        textField.placeholder = state.placeholder
        textField.font = state.font
        textField.textColor = state.color
        switch state.type {
        case let .date(date):
            makeForDateOfBirth(date)
        default:
            break
        }
    }
    
    private func makeForDateOfBirth(_ date: Date? = nil) {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        if let date = date {
            picker.date = date
        } else {
            picker.date = Date()
        }
        picker.maximumDate = Date()
        textField.inputView = picker
    }
}
