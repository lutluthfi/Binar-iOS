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
    private var heightConstraint: NSLayoutConstraint?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.addSubview(content)
        leadingConstraint = content.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        trailingConstraint = content.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        topConstraint = content.topAnchor.constraint(equalTo: contentView.topAnchor)
        bottomConstraint = content.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        heightConstraint = content.heightAnchor.constraint(greaterThanOrEqualToConstant: 1)
        content.makeConstraint(builder: { _ in
            heightConstraint!
            leadingConstraint!
            trailingConstraint!
            topConstraint!
            bottomConstraint!
        })
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        if let reusableCell = content as? ReusableTableCell {
            reusableCell.onPrepareReuse()
        }
    }
    
    private func updateConstraint() {
        leadingConstraint?.constant = padding.left
        trailingConstraint?.constant = padding.right * -1
        topConstraint?.constant = padding.top
        bottomConstraint?.constant = padding.bottom * -1
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}

extension TableCell {
    func setHeight(_ height: CGFloat) {
        heightConstraint?.isActive = false
        
        heightConstraint = content.heightAnchor.constraint(equalToConstant: height)
        heightConstraint?.isActive = true
    }
}
