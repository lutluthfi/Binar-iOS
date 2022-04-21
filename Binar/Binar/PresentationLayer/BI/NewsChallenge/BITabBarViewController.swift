//
//  ViewController.swift
//  programmatically
//
//  Created by Bagas on 04/04/22.
//

import UIKit

final class BITabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tabBar.tintColor = .systemPink
        tabBar.isTranslucent = true

        let todayViewController = BITodayNewsViewController()
        todayViewController.tabBarItem = UITabBarItem(
            title: "Today",
            image: UIImage(systemName: "house.fill"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        let newsViewController = BIAnotherNewsViewController()
        newsViewController.tabBarItem = UITabBarItem(
            title: "News",
            image: UIImage(systemName: "newspaper.fill"),
            selectedImage: UIImage(systemName: "newspaper.fill")
        )
        
        let audioViewController = BINewsAudioViewController()
        audioViewController.tabBarItem = UITabBarItem(
            title: "Audio",
            image: UIImage(systemName: "headphones"),
            selectedImage: UIImage(systemName: "headphones")
        )
        
        let followingViewController = BINewsFollowingViewController()
        followingViewController.tabBarItem = UITabBarItem(
            title: "Following",
            image: UIImage(systemName: "rectangle.stack.fill"),
            selectedImage: UIImage(systemName: "rectangle.stack.fill")
        )
        
        let searchViewController = BINewsSearchViewController()
        searchViewController.tabBarItem = UITabBarItem(
            title: "Search",
            image: UIImage(systemName: "magnifyingglass"),
            selectedImage: UIImage(systemName: "magnifyingglass")
        )
        
        let _viewControllers: [UINavigationController] = [
            todayViewController, newsViewController, audioViewController, followingViewController, searchViewController
        ].map { UINavigationController(rootViewController: $0) }
        
        viewControllers = _viewControllers
        
    }
}
