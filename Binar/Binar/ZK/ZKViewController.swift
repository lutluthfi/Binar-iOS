//
//  ZKViewController.swift
//  Binar
//
//  Created by karen syah on 17/03/22.
//

import UIKit

class ZKViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    var name: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = name
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
