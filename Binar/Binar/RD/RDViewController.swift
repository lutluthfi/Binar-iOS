//
//  RDViewController.swift
//  Binar
//
//  Created by Raden Dimas on 15/03/22.
//

import UIKit

final class RDViewController: UIViewController {
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
        self.view.backgroundColor = .white
    }
}
