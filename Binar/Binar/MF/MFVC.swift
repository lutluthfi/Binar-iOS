//
//  MFVC.swift
//  Binar
//
//  Created by Maulana Frasha on 15/03/22.
//

import UIKit

final class MFVC: UIViewController {
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
    }
}
