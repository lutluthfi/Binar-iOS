//
//  ARViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 14/03/22.
//

import UIKit

final class ARViewController: UIViewController {
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
    }
}
