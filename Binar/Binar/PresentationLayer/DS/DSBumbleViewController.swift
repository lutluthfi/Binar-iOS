//
//  DSBumbleViewController.swift
//  Binar
//
//  Created by Daffashiddiq on 05/04/22.
//

import UIKit

class DSBumbleViewController: UIViewController {
    
    var mainView = UIImageView()
    
    var backView = UIView()
    
    var nameView = UILabel()
        

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMainViewLayout()
        setBackViewLayout()
        setNameViewLayout()
        
        // Do any additional setup after loading the view.
    }
    
    func setBackViewLayout() {
        mainView.addSubview(backView)
        backView.backgroundColor = .white
        backView.frame.size.width = 200
        backView.frame.size.height = 100
        backView.translatesAutoresizingMaskIntoConstraints = false
//        nameView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10).isActive = true
        backView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -10).isActive = true
        backView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10).isActive = true
        backView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10).isActive = true
    }
    
    
    func setMainViewLayout() {
        mainView.loadImage(resource: "https://robohash.org/etvelitvoluptatum.png?size=700x700&set=set1")
        view.addSubview(mainView)
        mainView.backgroundColor = .orange
        mainView.rounded(cornerRadius: 20)
        mainView.contentMode = UIView.ContentMode.scaleAspectFit
        mainView.frame.size.width = 200
        mainView.frame.size.height = 200
        mainView.center = view.center
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
    }
    
    func setNameViewLayout() {
        mainView.addSubview(nameView)
        
        nameView.text = "Daffa"
        nameView.translatesAutoresizingMaskIntoConstraints = false
//        nameView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10).isActive = true
        nameView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -10).isActive = true
        nameView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10).isActive = true
        nameView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10).isActive = true
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
