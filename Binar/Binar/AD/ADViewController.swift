//
//  ADViewController.swift
//  Binar
//
//  Created by Aiedyl Dava Akbari on 15/03/22.
//

import UIKit

class ADViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
        myLabel.text = name
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
