//
//  THViewController.swift
//  Binar
//
//  Created by Tio Hardadi Somantri on 3/15/22.
//

import UIKit

final class THViewController: UIViewController {
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
    }
}
