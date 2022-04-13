//
//  InstagramLikesLabel.swift
//  Binar
//
//  Created by Raden Dimas on 13/04/22.
//

import UIKit

class InstagramLikesLabelView: UIView {
    
    private lazy var instagramLikesLabel: UILabel = {
        let likesLabel = UILabel()
        
        return likesLabel
    }()
    
    private lazy var totalLikesLabel: UILabel = {
        let likesLabel = UILabel()
        
        return likesLabel
    }()
    
    private lazy var titleLikesLabel: UILabel = {
        let likesLabel = UILabel()
        
        return likesLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createSubViews() {
        
    }
    
    
}
