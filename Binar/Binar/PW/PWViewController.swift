//
//  PWViewController.swift
//  Binar
//
//  Created by user on 15/03/22.
//

import Foundation
import UIKit


final class PWViewController: UIViewController {
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
    }
}
