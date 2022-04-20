//
//  IGTabBarController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 12/04/22.
//

import UIKit

final class IGTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        
        let homeViewController = IGHomeViewController()
        homeViewController.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        let profileViewController = IGProfileViewController()
        profileViewController.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill")
        )
        
        let viewControllers: [UIViewController] = [homeViewController, profileViewController].map {
            UINavigationController(rootViewController: $0)
        }
        self.viewControllers = viewControllers
    }
}
