//
//  IGLikesLabelViewController.swift
//  Binar
//
//  Created by Daffashiddiq on 13/04/22.
//

import UIKit

class IGLikesLabelViewController: UIViewController {
    
    var likesLabel = IGLikesLabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLabel()
        // Do any additional setup after loading the view.
    }
    
    func setLabel () {
        let label = likesLabel.setLikesLabel(numberOfLikes: 798699234904393459)
        
        view.addSubview(label)
        
        label.makeConstraint {
            [$0.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
             $0.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor)
            ]
        }
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
