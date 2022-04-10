//
//  BIDashboardViewController.swift
//  Binar
//
//  Created by Bagas on 10/04/22.
//

import UIKit

final class BIDashboardViewController: UIViewController {
//
//    var fasilChallenge = ["Fasil Challenge 1", "Fasil Challenge 2"]
//    var binarChallenge = ["Binar Challenge 1", "Binar Challenge 2", "Binar Challenge 3"]
    var challengeArray = [["Fasil Challenge 1", "Fasil Challenge 2"], ["Binar Challenge 1", "Binar Challenge 2", "Binar Challenge 3"]]
    
    var scrollView = UIScrollView()
    var firstTableView = UITableView(frame: .zero, style: .insetGrouped)
//    var secondTableView = UITableView()
    
    var selectedChallenge: String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        title = "Bagas' Dashboard"
        
        firstTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        firstTableView.delegate = self
        firstTableView.dataSource = self
        firstTableView.isScrollEnabled = false
        firstTableView.alwaysBounceVertical = false
        
//        secondTableView.register(UITableViewCell.self, forCellReuseIdentifier: )
//        secondTableView.delegate = self
//        secondTableView.dataSource = self
        
        addSubviews()
        setupViews()
        setupConstraints()
        
    }
    
    fileprivate func addSubviews() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(firstTableView)
//        scrollView.addSubview(secondTableView)
        
    }
    
    fileprivate func setupViews() {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        firstTableView.translatesAutoresizingMaskIntoConstraints = false
        firstTableView.backgroundColor = .secondarySystemBackground
        
//        secondTableView.translatesAutoresizingMaskIntoConstraints = false

    }
    
    fileprivate func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            view.heightAnchor.constraint(greaterThanOrEqualToConstant: view.frame.height),
            view.widthAnchor.constraint(greaterThanOrEqualToConstant: view.frame.width),
            
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor),
            
            firstTableView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            firstTableView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            firstTableView.heightAnchor.constraint(equalToConstant: 280),
            firstTableView.widthAnchor.constraint(equalTo: view.widthAnchor)
            
//            secondTableView.topAnchor.constraint(equalTo: firstTableView.bottomAnchor, constant: 20),
//            secondTableView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        
        ])
        
    }
    
}

extension BIDashboardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return challengeArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return challengeArray[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let sectionTitle: String?
        
        switch section{
        case 0:
            sectionTitle = "Fasil Challenge"
        case 1:
            sectionTitle = "Binar Challenge"
            
        default:
            sectionTitle = " "
        }
        
        return sectionTitle
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let section = indexPath.section
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        cell.textLabel?.text = (challengeArray[section])[row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let row = indexPath.row
        let section = indexPath.section
        selectedChallenge = (challengeArray[section])[row]
        
        switch selectedChallenge {
        case "Fasil Challenge 1":
            navigationController?.pushViewController(BIAnimalTableViewController(style: .insetGrouped), animated: true)
            
        case "Fasil Challenge 2":
            navigationController?.pushViewController(BITabBarViewController(), animated: true)
            navigationController?.isNavigationBarHidden = true
            
        case "Binar Challenge 1":
            navigationController?.pushViewController(BIViewController(), animated: true)
            
        case "Binar Challenge 2":
//            navigationController?.pushViewController(BIChallengeViewController(), animated: true)
            return
            
        case "Binar Challenge 3":
            navigationController?.pushViewController(BICharacterViewController(), animated: true)
            
        default:
            return
        }
    }
    
}
