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
            image: UIImage(systemName: "magnifyingglass"),
            selectedImage: UIImage(systemName: "magnifyingglass.circle")
        )
        
        let radioViewController = RDRadioSpotifyViewController()
        radioViewController.tabBarItem = UITabBarItem(
            title: "Radio",
            image: UIImage(systemName: "speaker.3"),
            selectedImage: UIImage(systemName: "speaker.3.fill")
        )
        let libraryViewController = RDLibrarySpotifyViewController()
        libraryViewController.tabBarItem = UITabBarItem(
            title: "Library",
            image: UIImage(systemName: "tray"),
            selectedImage: UIImage(systemName: "tray.fill")
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
    
    let apperance = UINavigationBarAppearance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Browse"
        apperance.titleTextAttributes = [.foregroundColor: UIColor.white]
        apperance.backgroundColor = .black
        navigationItem.standardAppearance = apperance
        navigationItem.scrollEdgeAppearance = apperance
    }
}
final class RDSearchSpotifyViewController: UIViewController {
    
    let apperance = UINavigationBarAppearance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Search"
        apperance.titleTextAttributes = [.foregroundColor: UIColor.white]
        apperance.backgroundColor = .black
        navigationItem.standardAppearance = apperance
        navigationItem.scrollEdgeAppearance = apperance
    }
}
final class RDRadioSpotifyViewController: UIViewController {
    let apperance = UINavigationBarAppearance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Radio"
        apperance.titleTextAttributes = [.foregroundColor: UIColor.white]
        apperance.backgroundColor = .black
        navigationItem.standardAppearance = apperance
        navigationItem.scrollEdgeAppearance = apperance
    }
}
final class RDLibrarySpotifyViewController: UIViewController {
    let apperance = UINavigationBarAppearance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Library"
        apperance.titleTextAttributes = [.foregroundColor: UIColor.white]
        apperance.backgroundColor = .black
        navigationItem.standardAppearance = apperance
        navigationItem.scrollEdgeAppearance = apperance
    }
}
