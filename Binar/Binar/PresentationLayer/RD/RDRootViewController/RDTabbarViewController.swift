//
//  RDTabbarViewController.swift
//  Binar
//
//  Created by Raden Dimas on 08/04/22.
//

import UIKit

final class RDTabbarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabbarView()
        
        setupNavigationVC()
    }
    
    private func setupTabbarView() {
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
    }
    
    private func setupNavigationVC() {
        let homeViewController = RDHomeViewController()
        homeViewController.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )

        let profileViewController = RDProfileViewController()
        profileViewController.tabBarItem = UITabBarItem(
            title: "Browse",
            image: UIImage(systemName: "square.grid.2x2.fill"),
            selectedImage: UIImage(systemName: "square.grid.2x2.fill")
        )

        let settingsViewController = RDSettingsViewController()
        settingsViewController.tabBarItem = UITabBarItem(
            title: "Search",
            image: UIImage(systemName: "magnifyingglass"),
            selectedImage: UIImage(systemName: "magnifyingglass")
        )
        
        let _viewControllers: [UINavigationController] = [
            homeViewController, profileViewController,
            settingsViewController
        ].map {
            let navigationController = UINavigationController(rootViewController: $0)
            navigationController.setNavigationBarHidden(true, animated: false)
            return navigationController
        }
        viewControllers = _viewControllers
    }

    
}
