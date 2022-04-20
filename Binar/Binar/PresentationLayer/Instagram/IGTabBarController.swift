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
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        let homeViewController = IGHomeViewController()
        homeViewController.title = "Home"
        homeViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        let profileViewController = IGProfileViewController()
        profileViewController.title = "Profile"
        profileViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill")
        )
        
        let viewControllers: [UIViewController] = [homeViewController, profileViewController].map {
            UINavigationController(rootViewController: $0)
        }
        setViewControllers(viewControllers, animated: false)
    }
}
