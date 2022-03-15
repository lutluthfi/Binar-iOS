//
//  AKViewController.swift
//  Binar
//
//  Created by Adrian K on 15/03/22.
//

import UIKit

final class AKViewController: UIViewController {
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
    }
}
