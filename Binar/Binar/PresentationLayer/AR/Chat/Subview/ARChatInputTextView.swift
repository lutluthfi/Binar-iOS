//
//  ARChatInputTextView.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 04/04/22.
//

import UIKit

final class ARChatInputTextView: UIView {
    lazy var backgroundView: UIVisualEffectView = .makeBlur(for: .light)
    lazy var textView: UITextView = makeTextView()
    lazy var sendButton: UIButton = makeSendButton()
    
    private var heightTextViewConstraint: NSLayoutConstraint!
    
    private let sendButtonLength: CGFloat = 32
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAddSubview()
        setupConstraint()
    }
    
    private func setupAddSubview() {
        addSubview(backgroundView)
        addSubview(textView)
        addSubview(sendButton)
    }
    
    private func setupConstraint() {
        backgroundView.makeConstraint {
            [$0.leadingAnchor.constraint(equalTo: self.leadingAnchor),
             $0.trailingAnchor.constraint(equalTo: self.trailingAnchor),
             $0.bottomAnchor.constraint(equalTo: self.bottomAnchor),
             $0.topAnchor.constraint(equalTo: self.topAnchor)]
        }
        textView.makeConstraint {
            self.heightTextViewConstraint = $0.heightAnchor.constraint(equalToConstant: 32)
            return [
                $0.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
                $0.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
                $0.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -12),
                self.heightTextViewConstraint
            ]
        }
        sendButton.makeConstraint {
            [$0.heightAnchor.constraint(equalToConstant: self.sendButtonLength),
             $0.widthAnchor.constraint(equalToConstant: self.sendButtonLength),
             $0.centerYAnchor.constraint(equalTo: self.textView.centerYAnchor),
             $0.leadingAnchor.constraint(equalTo: self.textView.trailingAnchor, constant: 12),
             $0.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12)]
        }
    }
    
    private func setupView() {
        backgroundView.isHidden = true
    }
    
    @objc private func onSendButtonTap() {
        
    }
    
    private func makeTextView() -> UITextView {
        let view = UITextView()
        view.delegate = self
        view.backgroundColor = .white
        view.rounded(cornerRadius: 8, borderWidth: 1, borderColor: .systemGray)
        view.font = .preferredFont(forTextStyle: .body)
        view.textContainerInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        view.textColor = .darkText
        return view
    }
    
    private func makeSendButton() -> UIButton {
        let view = UIButton()
        let image = UIImage(systemName: "paperplane.circle.fill")
        view.setImage(image, for: .normal)
        view.imageView?.contentMode = .scaleAspectFit
        view.contentVerticalAlignment = .fill
        view.contentHorizontalAlignment = .fill
        view.addTarget(self, action: #selector(onSendButtonTap), for: .touchUpInside)
        return view
    }
}

extension ARChatInputTextView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
    }
}
