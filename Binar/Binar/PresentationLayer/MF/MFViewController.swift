//
//  MFVC.swift
//  Binar
//
//  Created by Maulana Frasha on 15/03/22.
//

import UIKit

final class MFViewController: UITabBarController{
    
    var name: String?
    
    
    @IBOutlet weak var tabBarOutlet: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = name
        
        tabBarOutlet.unselectedItemTintColor = .black
        tabBarOutlet.tintColor = UIColor(red: 0.21, green: 0.36, blue: 0.49, alpha: 1)
        
        if let tabBarItem1 = tabBarOutlet.items?[0] {
            tabBarItem1.title = "Binar Challenge"
            tabBarItem1.image = UIImage(named: "MFButton1")?.withRenderingMode(.alwaysOriginal)
            tabBarItem1.selectedImage = UIImage(named: "MFButton2")?.withRenderingMode(.alwaysOriginal)
        }
        
        if let tabBarItem2 = tabBarOutlet.items?[1] {
            tabBarItem2.title = "Fasil Challenge"
            tabBarItem2.image = UIImage(named: "MFButton1")?.withRenderingMode(.alwaysOriginal)
            tabBarItem2.selectedImage = UIImage(named: "MFButton2")?.withRenderingMode(.alwaysOriginal)
        }
        
    }
}
