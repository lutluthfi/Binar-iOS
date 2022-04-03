//
//  ARTabBarViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 03/04/22.
//

import UIKit

final class ARTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeViewController = ARHomeViewController()
        homeViewController.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        let browseViewController = ARBrowseViewController()
        browseViewController.tabBarItem = UITabBarItem(
            title: "Browse",
            image: UIImage(systemName: "square.grid.2x2.fill"),
            selectedImage: UIImage(systemName: "square.grid.2x2.fill")
        )
        
        let searchViewController = ARSearchViewController()
        searchViewController.tabBarItem = UITabBarItem(
            title: "Search",
            image: UIImage(systemName: "magnifyingglass"),
            selectedImage: UIImage(systemName: "magnifyingglass")
        )
        
        let _viewControllers: [UINavigationController] = [
            homeViewController, browseViewController,
            searchViewController
        ].map { UINavigationController(rootViewController: $0) }
        
        tabBar.backgroundColor = .systemBackground
        viewControllers = _viewControllers
    }
}

final class ARHomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed
    }
}

final class ARBrowseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGreen
    }
}

final class ARSearchViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
    }
}
