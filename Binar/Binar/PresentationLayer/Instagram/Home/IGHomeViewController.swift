//
//  IGHomeViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 12/04/22.
//

import UIKit

final class IGHomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let likesLabel = IGLikesLabel()
        // add subview
        // constraint
        
        likesLabel.configure(1)
        
        let usernameLabel = IGUsernameLabel()
        usernameLabel.onTap = {
            print("do something")
        }
        usernameLabel.configure(username: "binaracademy")
        
        // avatarImageView.configure(size: .x32, url: "https://")
        
        // imageButton.onTap = { }
        // imageButton.configure(image: commentImage)
    }
    
}
