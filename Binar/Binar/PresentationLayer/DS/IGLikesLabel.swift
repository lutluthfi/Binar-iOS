//
//  IGLikesLabelViewController.swift
//  Binar
//
//  Created by Daffashiddiq on 13/04/22.
//

import UIKit

class IGLikesLabel: UIView {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
    
    private var text: String = "like"
    
    private var number: Int = 0
    
    func setLikesLabel(numberOfLikes num: Int) -> UILabel{
//        if num >= 1000 {
//            text = "\(num / 1000).\(num % 1000) likes"
//        }
//        if num >= 1000000 {
//            text = "\(num / 1000000).\((num % 1000000) / 1000).\((num % 1000000) % 1000) likes"
//        }

        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let formattedNumber = numberFormatter.string(from: NSNumber(value:num)) else { return UILabel()}
        
        if num > 1 {
            text = "\(formattedNumber) likes"
        } else {
            text = "\(formattedNumber) like"
        }
        
        
        let label = UILabel()
        
        label.text = text
                
        return label
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
