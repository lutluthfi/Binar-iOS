//
//  AKTabBarController.swift
//  Binar
//
//  Created by Adrian K on 09/04/22.
//

import UIKit

final class AKTabBarController: UITabBarController {
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
}
