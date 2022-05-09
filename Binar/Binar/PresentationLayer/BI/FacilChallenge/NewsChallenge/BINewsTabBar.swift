//
//  ViewController.swift
//  programmatically
//
//  Created by Bagas on 04/04/22.
//

import UIKit
import SafariServices

final class BITabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tabBar.tintColor = .systemPink
        tabBar.isTranslucent = true

        let todayViewController = BITodayViewController()
        todayViewController.tabBarItem = UITabBarItem(
            title: "Today",
            image: UIImage(systemName: "house.fill"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        let newsViewController = BINewsViewController()
        newsViewController.tabBarItem = UITabBarItem(
            title: "News",
            image: UIImage(systemName: "newspaper.fill"),
            selectedImage: UIImage(systemName: "newspaper.fill")
        )
        
        let audioViewController = BIAudioViewController()
        audioViewController.tabBarItem = UITabBarItem(
            title: "Audio",
            image: UIImage(systemName: "headphones"),
            selectedImage: UIImage(systemName: "headphones")
        )
        
        let followingViewController = BIFollowingViewController()
        followingViewController.tabBarItem = UITabBarItem(
            title: "Following",
            image: UIImage(systemName: "rectangle.stack.fill"),
            selectedImage: UIImage(systemName: "rectangle.stack.fill")
        )
        
        let searchViewController = BISearchViewController()
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

class BITodayViewController: UIViewController, SFSafariViewControllerDelegate {
    
//    var displayedStudents: [Student] = Student.sorted
    
    let boundWidth: Int = Int(UIScreen.main.bounds.width)
    
    var scrollView = UIScrollView()
    let tableView = UITableView()
    let button = UIButton()
    let appleNewsLabel = UILabel()
    let toDateLabel = UILabel()
    let topStoriesLabel = UILabel()
    var divider = UIView()
    
    var newsView = UIView()
    var newsImageView = UIImageView()
    var newsPortalImageView = UIImageView()
    var newsLabel = UILabel()
    var newsDetailLabel = UILabel()
    var newsDivider = UIView()
    var moreCoverageButton = UIButton()
    var newsMoreButton = UIButton()
    
    var news2View = UIView()
    var news2ImageView = UIImageView()
    var news2PortalImageView = UIImageView()
    var news2Label = UILabel()
    var news2Divider = UIView()
    var news2MoreButton = UIButton()
    var news2TimeIntervalLabel = UILabel()
    
    var news3View = UIView()
    var news3ImageView = UIImageView()
    var news3PortalImageView = UIImageView()
    var news3Label = UILabel()
    var news3Divider = UIView()
    var news3MoreButton = UIButton()
    var news3TimeIntervalLabel = UILabel()
    
    var news4View = UIView()
    var news4ImageView = UIImageView()
    var news4PortalImageView = UIImageView()
    var news4Label = UILabel()
    var news4Divider = UIView()
    var news4MoreButton = UIButton()
    var news4TimeIntervalLabel = UILabel()
    
    var news5View = UIView()
    var news5ImageView = UIImageView()
    var news5PortalImageView = UIImageView()
    var news5Label = UILabel()
    var news5Divider = UIView()
    var news5MoreButton = UIButton()
    var news5TimeIntervalLabel = UILabel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .systemGroupedBackground
        
        createView()
        setupAddSubview()
        setupConstraints()
        setupView()
  
    }
    
    
    @objc func didTapNewsView(_ sender: UITapGestureRecognizer) {
        print("did tap view", sender)
        let url = URL(string: "https://www.uefa.com/european-qualifiers/news/026a-1297500e1b34-a17bbbcad258-1000--ronaldo-all-time-top-scorer/")
        let safariVC = SFSafariViewController(url: url!)
        safariVC.delegate = self
        present(safariVC, animated: true, completion: nil)
    }
    
    @objc func didLongPressNewsView(_ sender: UILongPressGestureRecognizer) {

    }
    
    @objc func didTapNews2View(_ sender: UITapGestureRecognizer) {
        print("did tap view", sender)
        let url = URL(string: "https://9to5mac.com/2022/04/05/wwdc-2022-now-official-what-to-expect/")
        let safariVC = SFSafariViewController(url: url!)
        safariVC.delegate = self
        present(safariVC, animated: true, completion: nil)
    }
    
    @objc func didLongPressNews2View(_ sender: UILongPressGestureRecognizer) {

    }
    
    @objc func didTapNews3View(_ sender: UITapGestureRecognizer) {
        print("did tap view", sender)
        let url = URL(string: "https://www.bbc.com/sport/61012030")
        let safariVC = SFSafariViewController(url: url!)
        safariVC.delegate = self
        present(safariVC, animated: true, completion: nil)
    }
    
    @objc func didLongPressNews3View(_ sender: UILongPressGestureRecognizer) {

    }
    
    @objc func didTapNews4View(_ sender: UITapGestureRecognizer) {
        print("did tap view", sender)
        let url = URL(string: "https://edition.cnn.com/2022/04/06/business/hm-baby-clothes-compost/index.html")
        let safariVC = SFSafariViewController(url: url!)
        safariVC.delegate = self
        present(safariVC, animated: true, completion: nil)
    }
    
    @objc func didLongPressNews4View(_ sender: UILongPressGestureRecognizer) {

    }
    
    @objc func didTapNews5View(_ sender: UITapGestureRecognizer) {
        print("did tap view", sender)
        let url = URL(string: "https://www.nationalgeographic.com/travel/article/what-dolly-parton-wants-us-to-know-about-the-smoky-mountains")
        let safariVC = SFSafariViewController(url: url!)
        safariVC.delegate = self
        present(safariVC, animated: true, completion: nil)
    }
    
    @objc func didLongPressNews5View(_ sender: UILongPressGestureRecognizer) {

    }
    
    func createView() {
        
        //        tableView.delegate = self
        //        tableView.dataSource = self
        let newsTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapNewsView(_:)))
        let newsLongPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(didLongPressNewsView(_:)))
        let news2TapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapNews2View(_:)))
        let news2LongPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(didLongPressNews2View(_:)))
        let news3TapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapNews3View(_:)))
        let news3LongPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(didLongPressNews3View(_:)))
        let news4TapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapNews4View(_:)))
        let news4LongPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(didLongPressNews4View(_:)))
        let news5TapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapNews5View(_:)))
        let news5LongPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(didLongPressNews5View(_:)))
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 50, width: view.frame.width, height: (view.frame.height - 50)))
        
        divider = UIView(frame: CGRect(x: 20, y: 100, width: (view.frame.width - 40), height: 1))
        
        newsView = UIView(frame: CGRect(x: 20, y: 175, width: (view.frame.width - 40), height: 520))
        newsView.addInteraction(UIContextMenuInteraction(delegate: self))
        newsView.addGestureRecognizer(newsTapGestureRecognizer)
        newsView.addGestureRecognizer(newsLongPressRecognizer)
        newsImageView.frame = CGRect(x: 0, y: 0, width: newsView.frame.width, height: 275)
        newsDivider = UIView(frame: CGRect(x: 0, y: 480, width: (view.frame.width - 40), height: 1))
        
        news2View = UIView(frame: CGRect(x: 20, y: 702, width: ((view.frame.width / 2) - 24), height: 300))
        news2View.addInteraction(UIContextMenuInteraction(delegate: self))
        news2View.addGestureRecognizer(news2TapGestureRecognizer)
        news2View.addGestureRecognizer(news2LongPressRecognizer)
        news2ImageView.frame = CGRect(x: 0, y: 0, width: news2View.frame.width, height: 140)
        news2Divider = UIView(frame: CGRect(x: 0, y: 270, width: (news2View.frame.width), height: 1))
        
        news3View = UIView(frame: CGRect(x: (view.frame.maxX - 20 - news2View.frame.width), y: 702, width: ((view.frame.width / 2) - 24), height: 300))
        news3View.addInteraction(UIContextMenuInteraction(delegate: self))
        news3View.addGestureRecognizer(news3TapGestureRecognizer)
        news3View.addGestureRecognizer(news3LongPressRecognizer)
        news3ImageView.frame = CGRect(x: 0, y: 0, width: news3View.frame.width, height: 140)
        news3Divider = UIView(frame: CGRect(x: 0, y: 270, width: (news3View.frame.width), height: 1))
        
        news4View = UIView(frame: CGRect(x: 20, y: 1010, width: (view.frame.width - 40), height: 175))
        news4View.addInteraction(UIContextMenuInteraction(delegate: self))
        news4View.addGestureRecognizer(news4TapGestureRecognizer)
        news4View.addGestureRecognizer(news4LongPressRecognizer)
        news4ImageView.frame = CGRect(x: (view.frame.midX + 20), y: 13, width: 120, height: 120)
        news4ImageView.clipsToBounds = true
        news4ImageView.layer.cornerRadius = 12
        news4Divider = UIView(frame: CGRect(x: 0, y: 145, width: (view.frame.width - 40), height: 1))
        
        news5View = UIView(frame: CGRect(x: 20, y: 1195, width: (view.frame.width - 40), height: 175))
        news5View.addGestureRecognizer(news5TapGestureRecognizer)
        news5View.addGestureRecognizer(news5LongPressRecognizer)
        news5ImageView.frame = CGRect(x: (view.frame.midX + 20), y: 13, width: 120, height: 120)
        news5ImageView.clipsToBounds = true
        news5ImageView.layer.cornerRadius = 12
        news5View.addInteraction(UIContextMenuInteraction(delegate: self))
        news5Divider = UIView(frame: CGRect(x: 0, y: 145, width: (view.frame.width - 40), height: 1))
        
    }

    func setupView() {
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        scrollView.backgroundColor = .systemGroupedBackground
        scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: UIScreen.main.bounds.height * 1.7)
        
        newsView.backgroundColor = .tertiarySystemBackground
        newsView.layer.cornerRadius = 12
        newsView.clipsToBounds = true
        
        newsImageView.loadImage(resource: "https://akcdn.detik.net.id/community/media/visual/2022/03/29/cristiano-ronaldo-2_169.jpeg?w=700&q=90")
        newsImageView.contentMode = .scaleAspectFill
        
        divider.backgroundColor = .systemGray5
        
        appleNewsLabel.text = "News"
        appleNewsLabel.font = UIFont.systemFont(ofSize: 30, weight: .black)
        appleNewsLabel.translatesAutoresizingMaskIntoConstraints = false
        appleNewsLabel.textColor = .label
        appleNewsLabel.textAlignment = .left
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d"
        let todayString = formatter.string(from: Date())
        toDateLabel.text = todayString
        toDateLabel.textColor = .gray
        toDateLabel.translatesAutoresizingMaskIntoConstraints = false
        toDateLabel.textAlignment = .left
        toDateLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        

        topStoriesLabel.text = "Top Stories"
        topStoriesLabel.font = UIFont.systemFont(ofSize: 30, weight: .black)
        topStoriesLabel.translatesAutoresizingMaskIntoConstraints = false
        topStoriesLabel.textColor = .systemPink
        topStoriesLabel.textAlignment = .left
        
        newsPortalImageView.frame = CGRect(x: 10, y: 290, width: 50, height: 20)
        newsPortalImageView.loadImage(resource: "https://upload.wikimedia.org/wikipedia/commons/c/cc/Uefa_2013.png?20130404224611")
        newsPortalImageView.contentMode = .scaleAspectFit
        newsPortalImageView.clipsToBounds = true
        
        newsLabel.translatesAutoresizingMaskIntoConstraints = false
        newsLabel.text = "Cristiano Ronaldo: All-time leading scorer in men's international football"
        newsLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        newsLabel.textColor = .label
        newsLabel.textAlignment = .left
        newsLabel.numberOfLines = 4
        
        newsDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        newsDetailLabel.text = "Cristiano Ronaldo holds the world record for international goals, having taken his tally to 115 in October 2021."
        newsDetailLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        newsDetailLabel.textColor = .secondaryLabel
        newsDetailLabel.textAlignment = .left
        newsDetailLabel.numberOfLines = 6
        
        newsDivider.backgroundColor = .secondarySystemBackground
        
        moreCoverageButton.setTitle("More coverage", for: .normal)
        moreCoverageButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        moreCoverageButton.translatesAutoresizingMaskIntoConstraints = false
        moreCoverageButton.backgroundColor = .systemGray4
        moreCoverageButton.titleLabel?.font = UIFont.systemFont(ofSize: 11, weight: .bold)
        moreCoverageButton.titleLabel?.textColor = .black
        moreCoverageButton.layer.cornerRadius = 14
        moreCoverageButton.tintColor = moreCoverageButton.titleLabel?.textColor
        moreCoverageButton.semanticContentAttribute = .forceRightToLeft
        
        newsMoreButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        newsMoreButton.translatesAutoresizingMaskIntoConstraints = false
        newsMoreButton.backgroundColor = .clear
        newsMoreButton.tintColor = .systemGray2
        if #available(iOS 14.0, *) {
            newsMoreButton.showsMenuAsPrimaryAction = true
        } else {
            // Fallback on earlier versions
        }
        let suggestLess = UIAction(title: "Suggest Less", image: UIImage(systemName: "hand.thumbsdown"), identifier: nil) { _ in
            
        }
        let suggestMore = UIAction(title: "Suggest More", image: UIImage(systemName: "hand.thumbsup"), identifier: nil) { _ in
            
        }
        let saveStory = UIAction(title: "Save Story", image: UIImage(systemName: "square.and.arrow.down"), identifier: nil) { _ in
            
        }
        let copyLink = UIAction(title: "Copy Link", image: UIImage(systemName: "link"), identifier: nil) { _ in
            
        }
        let shareStory = UIAction(title: "Share Story", image: UIImage(systemName: "square.and.arrow.up"), identifier: nil) { [self] _ in
            NewsSharer.share(in: self, newsHeadline: newsLabel.text!, newsImageUrlString: "https://akcdn.detik.net.id/community/media/visual/2022/03/29/cristiano-ronaldo-2_169.jpeg?w=700&q=90")
        }
        
        if #available(iOS 14.0, *) {
            newsMoreButton.menu = UIMenu(title: "", children: [suggestLess, suggestMore, saveStory, copyLink, shareStory].reversed())
        } else {
            // Fallback on earlier versions
        }
        
        
        news2View.backgroundColor = .tertiarySystemBackground
        news2View.layer.cornerRadius = 12
        news2View.clipsToBounds = true
        news2Divider.backgroundColor = .secondarySystemBackground
        
        news2ImageView.loadImage(resource: "https://images.macrumors.com/t/ob3CYcezD508MTBErXioYJfaVLs=/1600x0/article-new/2022/03/Apple-WWDC22-announcement-hero_big.jpg.large_2x.jpg")
        news2ImageView.contentMode = .scaleAspectFill
        
        news2PortalImageView.frame = CGRect(x: 10, y: 150, width: 70, height: 20)
        news2PortalImageView.loadImage(resource: "https://logos-download.com/wp-content/uploads/2020/06/9to5mac_Logo-700x163.png")
        news2PortalImageView.contentMode = .scaleAspectFit
        news2PortalImageView.clipsToBounds = true
        
        news2Label.translatesAutoresizingMaskIntoConstraints = false
        news2Label.text = "Apple officially announces all-online WWDC 2022 for June 6: iOS 16 and more expected"
        news2Label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        news2Label.textColor = .label
        news2Label.textAlignment = .left
        news2Label.numberOfLines = 5
        
//        let intervalFormatter = DateComponentsFormatter()
//        intervalFormatter.maximumUnitCount = 1
//        intervalFormatter.unitsStyle = .abbreviated
//        intervalFormatter.zeroFormattingBehavior = .dropAll
//        intervalFormatter.allowedUnits = [.day, .hour, .minute, .second]
//        let releaseFormatter = DateFormatter()
//        releaseFormatter.dateFormat = "dd MM yyyy HH.mm"
//
//        let news2ReleaseDate = releaseFormatter.date(from: "05 04 2022 09.03")
//        let currentTime = Date()
//        let news2ReleaseInterval = DateInterval(start: news2ReleaseDate!, end: currentTime)
//        let news2ReleaseIntervalString: String = intervalFormatter.string(from: news2ReleaseInterval)!
//
//        news2TimeIntervalLabel.text = news2ReleaseIntervalString
//        news2TimeIntervalLabel.textColor = .secondaryLabel
        
        news2MoreButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        news2MoreButton.translatesAutoresizingMaskIntoConstraints = false
        news2MoreButton.backgroundColor = .clear
        news2MoreButton.tintColor = .systemGray2
        if #available(iOS 14.0, *) {
            news2MoreButton.showsMenuAsPrimaryAction = true
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 14.0, *) {
            news2MoreButton.menu = UIMenu(title: "", children: [suggestLess, suggestMore, saveStory, copyLink, shareStory].reversed())
        } else {
            // Fallback on earlier versions
        }
        
        news3View.backgroundColor = .tertiarySystemBackground
        news3View.layer.cornerRadius = 12
        news3View.clipsToBounds = true
        news3Divider.backgroundColor = .secondarySystemBackground
        
        news3ImageView.loadImage(resource: "https://ichef.bbci.co.uk/onesport/cps/976/cpsprodpb/91D6/production/_123943373_emilybridges.jpg")
        news3ImageView.contentMode = .scaleAspectFill
        
        news3PortalImageView.frame = CGRect(x: 10, y: 150, width: 60, height: 15)
        news3PortalImageView.loadImage(resource: "https://brandslogos.com/wp-content/uploads/images/bbc-logo-1.png")
        news3PortalImageView.contentMode = .scaleAspectFill
        news3PortalImageView.clipsToBounds = true
        
        news3Label.translatesAutoresizingMaskIntoConstraints = false
        news3Label.text = "Prime Minister Boris Johnson says transgender women should not compete in women's sport"
        news3Label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        news3Label.textColor = .label
        news3Label.textAlignment = .left
        news3Label.numberOfLines = 5
        
        news3MoreButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        news3MoreButton.translatesAutoresizingMaskIntoConstraints = false
        news3MoreButton.backgroundColor = .clear
        news3MoreButton.tintColor = .systemGray2
        if #available(iOS 14.0, *) {
            news3MoreButton.showsMenuAsPrimaryAction = true
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 14.0, *) {
            news3MoreButton.menu = UIMenu(title: "", children: [suggestLess, suggestMore, saveStory, copyLink, shareStory].reversed())
        } else {
            // Fallback on earlier versions
        }
        
        news4View.backgroundColor = .tertiarySystemBackground
        news4View.layer.cornerRadius = 12
        news4View.clipsToBounds = true
        news4Divider.backgroundColor = .secondarySystemBackground
        
        news4ImageView.loadImage(resource: "https://cdn.cnn.com/cnnnext/dam/assets/220405171901-hm-baby-clothes-compost-02-exlarge-169.jpg")
        news4ImageView.contentMode = .scaleAspectFill
        
        news4PortalImageView.frame = CGRect(x: 10, y: 10, width: 80, height: 20)
        news4PortalImageView.loadImage(resource: "https://911003.smushcdn.com/2220393/wp-content/uploads/2020/01/CNN-business-logo-300x166.png?lossy=1&strip=1&webp=1")
        news4PortalImageView.contentMode = .scaleAspectFill
        news4PortalImageView.clipsToBounds = true
        
        news4Label.translatesAutoresizingMaskIntoConstraints = false
        news4Label.text = "H&M says you can compost its new line of baby clothes"
        news4Label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        news4Label.textColor = .label
        news4Label.textAlignment = .left
        news4Label.numberOfLines = 5
        
        news4MoreButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        news4MoreButton.translatesAutoresizingMaskIntoConstraints = false
        news4MoreButton.backgroundColor = .clear
        news4MoreButton.tintColor = .systemGray2
        if #available(iOS 14.0, *) {
            news4MoreButton.showsMenuAsPrimaryAction = true
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 14.0, *) {
            news4MoreButton.menu = UIMenu(title: "", children: [suggestLess, suggestMore, saveStory, copyLink, shareStory].reversed())
        } else {
            // Fallback on earlier versions
        }
        
        news5View.backgroundColor = .tertiarySystemBackground
        news5View.layer.cornerRadius = 12
        news5View.clipsToBounds = true
        news5Divider.backgroundColor = .secondarySystemBackground
        
        news5ImageView.loadImage(resource: "https://i.natgeofe.com/n/0337313d-70a8-4794-8450-510d032ffa63/GilianLaub_DollyParton-2008.jpg?w=2520&h=2056")
        news5ImageView.contentMode = .scaleAspectFill
        
        news5PortalImageView.frame = CGRect(x: 10, y: 10, width: 80, height: 25)
        news5PortalImageView.loadImage(resource: "https://logos-world.net/wp-content/uploads/2020/09/National-Geographic-Logo-700x394.png")
        news5PortalImageView.contentMode = .scaleAspectFill
        news5PortalImageView.clipsToBounds = true
        
        news5Label.translatesAutoresizingMaskIntoConstraints = false
        news5Label.text = "What Dolly Parton wants us to know about the Smoky Mountains"
        news5Label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        news5Label.textColor = .label
        news5Label.textAlignment = .left
        news5Label.numberOfLines = 5
        
        news5MoreButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        news5MoreButton.translatesAutoresizingMaskIntoConstraints = false
        news5MoreButton.backgroundColor = .clear
        news5MoreButton.tintColor = .systemGray2
        if #available(iOS 14.0, *) {
            news5MoreButton.showsMenuAsPrimaryAction = true
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 14.0, *) {
            news5MoreButton.menu = UIMenu(title: "", children: [suggestLess, suggestMore, saveStory, copyLink, shareStory].reversed())
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    func setupAddSubview() {
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(appleNewsLabel)
        scrollView.addSubview(toDateLabel)
        scrollView.addSubview(divider)
        scrollView.addSubview(topStoriesLabel)
        scrollView.addSubview(newsView)
        
        newsView.addSubview(newsImageView)
        newsView.addSubview(newsPortalImageView)
        newsView.addSubview(newsLabel)
        newsView.addSubview(newsDetailLabel)
        newsView.addSubview(newsDivider)
        newsView.addSubview(moreCoverageButton)
        newsView.addSubview(newsMoreButton)
        
        scrollView.addSubview(news2View)
        news2View.addSubview(news2Divider)
        news2View.addSubview(news2ImageView)
        news2View.addSubview(news2PortalImageView)
        news2View.addSubview(news2Label)
        news2View.addSubview(news2MoreButton)
        
        scrollView.addSubview(news3View)
        news3View.addSubview(news3Divider)
        news3View.addSubview(news3ImageView)
        news3View.addSubview(news3PortalImageView)
        news3View.addSubview(news3Label)
        news3View.addSubview(news3MoreButton)
        
        scrollView.addSubview(news4View)
        news4View.addSubview(news4Divider)
        news4View.addSubview(news4ImageView)
        news4View.addSubview(news4PortalImageView)
        news4View.addSubview(news4Label)
        news4View.addSubview(news4MoreButton)
        
        scrollView.addSubview(news5View)
        news5View.addSubview(news5Divider)
        news5View.addSubview(news5ImageView)
        news5View.addSubview(news5PortalImageView)
        news5View.addSubview(news5Label)
        news5View.addSubview(news5MoreButton)
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            appleNewsLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            appleNewsLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            appleNewsLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            
            toDateLabel.topAnchor.constraint(equalTo: appleNewsLabel.bottomAnchor, constant: -5),
            toDateLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            toDateLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            
            topStoriesLabel.topAnchor.constraint(equalTo: toDateLabel.bottomAnchor, constant: 45),
            topStoriesLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            topStoriesLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            
            newsImageView.topAnchor.constraint(equalTo: newsView.topAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: newsView.trailingAnchor),
            newsImageView.leadingAnchor.constraint(equalTo: newsView.leadingAnchor),
            
            newsPortalImageView.topAnchor.constraint(equalTo: newsImageView.bottomAnchor),
            newsPortalImageView.trailingAnchor.constraint(equalTo: newsView.trailingAnchor),
            newsPortalImageView.leadingAnchor.constraint(equalTo: newsView.leadingAnchor, constant: 10),
            
            newsLabel.topAnchor.constraint(equalTo: newsPortalImageView.bottomAnchor, constant: 2),
            newsLabel.trailingAnchor.constraint(equalTo: newsView.trailingAnchor, constant: -10),
            newsLabel.leadingAnchor.constraint(equalTo: newsView.leadingAnchor, constant: 10),
//            newsLabel.bottomAnchor.constraint(equalTo: newsView.bottomAnchor)
            
            newsDetailLabel.topAnchor.constraint(equalTo: newsLabel.bottomAnchor, constant: 5),
            newsDetailLabel.trailingAnchor.constraint(equalTo: newsView.trailingAnchor, constant: -10),
            newsDetailLabel.leadingAnchor.constraint(equalTo: newsView.leadingAnchor, constant: 10),
            
            moreCoverageButton.topAnchor.constraint(equalTo: newsDivider.bottomAnchor, constant: 5),
            moreCoverageButton.leadingAnchor.constraint(equalTo: newsView.leadingAnchor, constant: 15),
            moreCoverageButton.widthAnchor.constraint(equalToConstant: 110),
            moreCoverageButton.heightAnchor.constraint(equalToConstant: 28),
            
            newsMoreButton.topAnchor.constraint(equalTo: newsDivider.bottomAnchor, constant: 7),
            newsMoreButton.trailingAnchor.constraint(equalTo: newsView.trailingAnchor, constant: -15),
            
            news2Label.topAnchor.constraint(equalTo: news2PortalImageView.bottomAnchor, constant: 2),
            news2Label.trailingAnchor.constraint(equalTo: news2View.trailingAnchor, constant: -10),
            news2Label.leadingAnchor.constraint(equalTo: news2View.leadingAnchor, constant: 10),
            
            news2MoreButton.topAnchor.constraint(equalTo: news2Divider.bottomAnchor, constant: 3),
            news2MoreButton.trailingAnchor.constraint(equalTo: news2View.trailingAnchor, constant: -15),
            
            news3Label.topAnchor.constraint(equalTo: news3PortalImageView.bottomAnchor, constant: 5),
            news3Label.trailingAnchor.constraint(equalTo: news3View.trailingAnchor, constant: -10),
            news3Label.leadingAnchor.constraint(equalTo: news3View.leadingAnchor, constant: 10),
            
            news3MoreButton.topAnchor.constraint(equalTo: news3Divider.bottomAnchor, constant: 3),
            news3MoreButton.trailingAnchor.constraint(equalTo: news3View.trailingAnchor, constant: -15),
            
            news4Label.topAnchor.constraint(equalTo: news4PortalImageView.bottomAnchor, constant: 5),
            news4Label.trailingAnchor.constraint(equalTo: news4View.trailingAnchor, constant: -150),
            news4Label.leadingAnchor.constraint(equalTo: news4View.leadingAnchor, constant: 10),
            
            news4MoreButton.topAnchor.constraint(equalTo: news4Divider.bottomAnchor, constant: 3),
            news4MoreButton.trailingAnchor.constraint(equalTo: news4View.trailingAnchor, constant: -15),
            
            news5Label.topAnchor.constraint(equalTo: news5PortalImageView.bottomAnchor, constant: 5),
            news5Label.trailingAnchor.constraint(equalTo: news5View.trailingAnchor, constant: -150),
            news5Label.leadingAnchor.constraint(equalTo: news5View.leadingAnchor, constant: 10),
            
            news5MoreButton.topAnchor.constraint(equalTo: news5Divider.bottomAnchor, constant: 3),
            news5MoreButton.trailingAnchor.constraint(equalTo: news5View.trailingAnchor, constant: -15)
            
//            newsView.topAnchor.constraint(equalTo: button.topAnchor, constant: 50),
//            newsView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
//            newsView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor)
            
        ])
        
    }
}

//extension BITodayViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return displayedStudents.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        let row = indexPath.row
//        cell.textLabel?.text = displayedStudents[row].name
//        return cell
//    }
//
//}

extension BITodayViewController: UIContextMenuInteractionDelegate {
  func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
    return UIContextMenuConfiguration(
      identifier: nil,
      previewProvider: nil,
      actionProvider: { _ in
          
          let shareStory = UIAction(title: "Share Story", image: UIImage(systemName: "square.and.arrow.up"), identifier: nil) { [self] _ in
              NewsSharer.share(in: self, newsHeadline: newsLabel.text!, newsImageUrlString: "https://akcdn.detik.net.id/community/media/visual/2022/03/29/cristiano-ronaldo-2_169.jpeg?w=700&q=90")
          }
          
          let copyLink = UIAction(title: "Copy Link", image: UIImage(systemName: "link"), identifier: nil) { _ in
              
          }
          
          let saveStory = UIAction(title: "Save Story", image: UIImage(systemName: "square.and.arrow.down"), identifier: nil) { _ in
              
          }
          
          let suggestMore = UIAction(title: "Suggest More", image: UIImage(systemName: "hand.thumbsup"), identifier: nil) { _ in
              
          }
          
          let suggestLess = UIAction(title: "Suggest More", image: UIImage(systemName: "hand.thumbsdown"), identifier: nil) { _ in
              
          }
          
          let children = [shareStory, copyLink, saveStory, suggestMore, suggestLess]
        return UIMenu(title: "", children: children)
    })
  }
    
}

final class BIAudioViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Audio"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
    }
    

}

final class BIFollowingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Following"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
    }
}

final class BISearchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        navigationItem.searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController?.searchBar.isHidden = false
        navigationItem.searchController?.searchBar.placeholder = "Channels, Topics, & Stories"
    }
    
}
