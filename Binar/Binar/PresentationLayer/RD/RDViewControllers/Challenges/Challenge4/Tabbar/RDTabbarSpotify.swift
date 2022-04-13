//
//  RDTabbarSpotify.swift
//  Binar
//
//  Created by Raden Dimas on 13/04/22.
//

import UIKit

final class RDTabbarSpotify: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbarView()
        setupNavigationVC()
    }
    
    private func setupTabbarView() {
        view.backgroundColor = .black
        tabBar.barTintColor = .black
        tabBar.tintColor = .white
    }
    
    private func setupNavigationVC() {
        let layout = UICollectionViewFlowLayout()
        let homeViewController = RDChallenge4ViewController(collectionViewLayout: layout)
        homeViewController.navigationItem.leftBarButtonItem =  UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(back))
        homeViewController.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )

        let browseViewController = RDBrowseSpotifyViewController()
        browseViewController.tabBarItem = UITabBarItem(
            title: "Browse",
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill")
        )

        let searchViewController = RDSearchSpotifyViewController()
        searchViewController.tabBarItem = UITabBarItem(
            title: "Search",
            image: UIImage(systemName: "gear"),
            selectedImage: UIImage(systemName: "gear")
        )
        
        let radioViewController = RDRadioSpotifyViewController()
        radioViewController.tabBarItem = UITabBarItem(
            title: "Radio",
            image: UIImage(systemName: "gear"),
            selectedImage: UIImage(systemName: "gear")
        )
        let libraryViewController = RDLibrarySpotifyViewController()
        libraryViewController.tabBarItem = UITabBarItem(
            title: "Library",
            image: UIImage(systemName: "gear"),
            selectedImage: UIImage(systemName: "gear")
        )
        
        let _viewControllers: [UINavigationController] = [
            homeViewController, browseViewController,
            searchViewController,radioViewController,libraryViewController
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

final class RDBrowseSpotifyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
final class RDSearchSpotifyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
final class RDRadioSpotifyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
final class RDLibrarySpotifyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
