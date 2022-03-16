//
//  PWViewController.swift
//  Binar
//
//  Created by user on 15/03/22.
//

import UIKit

final class PWViewController: UIViewController {
    var name: String?
    @IBOutlet weak var myName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
        myName.text = name
    }
}
