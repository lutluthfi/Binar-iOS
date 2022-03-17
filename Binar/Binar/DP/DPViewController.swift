//
//  DPViewController.swift
//  Binar
//
//  Created by Dimas Purnomo on 15/03/22.
//

import UIKit

final class DPViewController: UIViewController {
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
    }
}

