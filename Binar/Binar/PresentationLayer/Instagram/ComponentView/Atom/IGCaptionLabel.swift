//
//  IGCaptionLabel.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 15/04/22.
//

import UIKit

final class IGCaptionLabel: UIView {
    typealias OnTap = () -> Void
    
    private lazy var textLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 17)
        view.numberOfLines = 2
        view.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTextLabelTapped))
        view.addGestureRecognizer(tapGesture)
        return view
    }()
    
    private var isCollapsed = true
    
    var onTap: OnTap?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(textLabel)
        textLabel.makeConstraint {[
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            $0.topAnchor.constraint(equalTo: self.topAnchor),
            $0.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ]}
    }
    
    @objc private func onTextLabelTapped(_ gesture: UITapGestureRecognizer) {
        if isCollapsed {
            textLabel.numberOfLines = 0
        } else {
            textLabel.numberOfLines = 2
        }
        isCollapsed.toggle()
        layoutIfNeeded()
        onTap?()
    }
    
    func configure(username: String, caption: String) {
        let textAttrString: NSMutableAttributedString = username.toUsernameAttrString().toMutable()
        let captionAttrString = NSAttributedString(
            string: " \(caption)",
            attributes: [.font: UIFont.systemFont(ofSize: 17)]
        )
        textAttrString.append(captionAttrString)
        textLabel.attributedText = textAttrString
    }
}

extension String {
    func toUsernameAttrString(color: UIColor? = nil) -> NSAttributedString {
        var _username = self
        _username.removeAll { $0 == "@" }
        var attributes: [NSAttributedString.Key: Any] = [:]
        attributes[.font] = UIFont.boldSystemFont(ofSize: 17)
        if let color = color {
            attributes[.foregroundColor] = color
        }
        return NSAttributedString(string: "@\(_username)", attributes: attributes)
    }
}

extension NSAttributedString {
    func toMutable() -> NSMutableAttributedString {
        NSMutableAttributedString(attributedString: self)
    }
}
