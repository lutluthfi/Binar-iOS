//
//  TableCell.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 21/04/22.
//

import UIKit

final class TableCell<Content>: UITableViewCell where Content: UIView {
    let content = Content()
    
    var padding: UIEdgeInsets = .zero {
        didSet { updateConstraint() }
    }
    
    private var leadingConstraint: NSLayoutConstraint?
    private var topConstraint: NSLayoutConstraint?
    private var trailingConstraint: NSLayoutConstraint?
    private var bottomConstraint: NSLayoutConstraint?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(content)
        content.makeConstraint {
            self.leadingConstraint = $0.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
            self.trailingConstraint = $0.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
            self.topConstraint = $0.topAnchor.constraint(equalTo: self.contentView.topAnchor)
            self.bottomConstraint = $0.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
            return [self.leadingConstraint!, self.trailingConstraint!, self.topConstraint!, self.bottomConstraint!]
        }
    }
    
    private func updateConstraint() {
        self.leadingConstraint?.constant = padding.left
        self.trailingConstraint?.constant = padding.right
        self.topConstraint?.constant = padding.top
        self.bottomConstraint?.constant = padding.bottom
    }
}
