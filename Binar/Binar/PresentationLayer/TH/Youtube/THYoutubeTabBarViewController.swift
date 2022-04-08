//
//  THYoutubeTabBarViewController.swift
//  Binar
//
//  Created by Tio Hardadi Somantri on 4/5/22.
//

import UIKit

final class THYoutubeTabBarViewController: UITabBarController {
    // hide navbar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // setup navigation bar
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setNavigationBar()
    }
    
    @objc func backToHome(){
        navigationController?.popViewController(animated: true)
    }
    
    func setNavigationBar() {
        let topSafeArea: CGFloat
        if #available(iOS 11.0, *) {
           topSafeArea = view.safeAreaInsets.top
        } else {
           topSafeArea = topLayoutGuide.length
        }
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: topSafeArea, width: view.frame.size.width, height: 44))
        let navItem = UINavigationItem()
        let logoItem: UIImageView = {
            let logo = UIImageView()
            logo.frame = CGRect(x: 0, y: 0, width: 90, height: 20)
            logo.loadImage(resource: "https://logodownload.org/wp-content/uploads/2014/10/youtube-logo-9.png")
            logo.isUserInteractionEnabled = true
            logo.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(backToHome)))
            return logo
        }()
        let btnLogoItem = UIBarButtonItem.init(customView: logoItem)
        
        navItem.leftBarButtonItem = btnLogoItem
        
        let recordBtn : UIBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "video.fill"),
            style: .plain,
            target: self,
            action: nil
        )
        let searchBtn : UIBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "magnifyingglass"),
            style: .plain,
            target: self,
            action: nil
        )
        
        let accountItem: UIImageView = {
            let account = UIImageView()
            account.frame = CGRect(x: 40, y: 0, width: 40, height: 40)
            account.loadImage(resource: "https://www.kindpng.com/picc/m/497-4973038_profile-picture-circle-png-transparent-png.png")
            return account
        }()
        let btnAccountItem = UIBarButtonItem.init(customView: accountItem)
        
        navItem.rightBarButtonItems = [btnAccountItem, searchBtn, recordBtn]
        
        
        navBar.setItems([navItem], animated: false)
        navBar.barTintColor = .white
        navBar.tintColor = .gray
        self.view.addSubview(navBar)
    }

    // setup tab bar
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeViewController = THYoutubeHomeViewController()
        homeViewController.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house.fill"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        let trendingViewController = THYoutubeTrendingViewController()
        trendingViewController.tabBarItem = UITabBarItem(
            title: "Trending",
            image: UIImage(systemName: "flame.fill"),
            selectedImage: UIImage(systemName: "flame.fill")
        )
        
        let subscriptionsViewController = THYoutubeSubscriptionsViewController()
        subscriptionsViewController.tabBarItem = UITabBarItem(
            title: "Subscriptions",
            image: UIImage(systemName: "rectangle.stack.badge.play.fill"),
            selectedImage: UIImage(systemName: "rectangle.stack.badge.play.fill")
        )
        
        let activityViewController = THYoutubeActivityViewController()
        activityViewController.tabBarItem = UITabBarItem(
            title: "Activity",
            image: UIImage(systemName: "bell.fill"),
            selectedImage: UIImage(systemName: "bell.fill")
        )
        
        let libraryViewController = THYoutubeLibraryViewController()
        libraryViewController.tabBarItem = UITabBarItem(
            title: "Library",
            image: UIImage(systemName: "folder.fill"),
            selectedImage: UIImage(systemName: "folder.fill")
        )
        
        let _viewControllers: [UINavigationController] = [
            homeViewController,
            trendingViewController,
            subscriptionsViewController,
            activityViewController,
            libraryViewController
        ].map { UINavigationController(rootViewController: $0) }
        
        tabBar.backgroundColor = .systemBackground
        tabBar.isTranslucent = false
        tabBar.selectedImageTintColor = .systemRed
        viewControllers = _viewControllers
    }
}


// page kosong

final class THYoutubeTrendingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        lazy var title: UILabel = {
            let view = UILabel()
            view.text = "Trending"
            return view
        }()
        view.addSubview(title)
        title.makeConstraint { view in
            [view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
             view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            ]
        }
    }
}

final class THYoutubeSubscriptionsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        lazy var title: UILabel = {
            let view = UILabel()
            view.text = "Subscriptions"
            return view
        }()
        view.addSubview(title)
        title.makeConstraint { view in
            [view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
             view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)]
        }
    }
}

final class THYoutubeActivityViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        lazy var title: UILabel = {
            let view = UILabel()
            view.text = "Activity"
            return view
        }()
        view.addSubview(title)
        title.makeConstraint { view in
            [view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
             view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)]
        }
        
    }
}

final class THYoutubeLibraryViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        lazy var title: UILabel = {
            let view = UILabel()
            view.text = "Library"
            return view
        }()
        view.addSubview(title)
        title.makeConstraint { view in
            [view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
             view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)]
        }
        
    }
}
