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
        tabBar.barTintColor = .systemBackground
        tabBar.tintColor = .label
    }
    
    private func setupNavigationVC() {
        let homeViewController = RDHomeViewController()
        homeViewController.navigationItem.leftBarButtonItem =  UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(back))
        homeViewController.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )

        let profileViewController = RDProfileViewController()
        profileViewController.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill")
        )

        let settingsViewController = RDSettingsViewController()
        settingsViewController.tabBarItem = UITabBarItem(
            title: "Settings",
            image: UIImage(systemName: "gear"),
            selectedImage: UIImage(systemName: "gear")
        )
        
        let _viewControllers: [UINavigationController] = [
            homeViewController, profileViewController,
            settingsViewController
        ].map {
            let navigationController = UINavigationController(rootViewController: $0)
            navigationController.setNavigationBarHidden(false, animated: false)
            return navigationController
        }
        viewControllers = _viewControllers
    }
    
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }

    
}
