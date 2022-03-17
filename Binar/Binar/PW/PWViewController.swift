//
//  PWViewController.swift
//  Binar
//
//  Created by user on 15/03/22.
//

import UIKit
import CardSlider


struct Item: CardSliderItem {
    var image: UIImage
    
    var title: String
    var rating: Int?
    var subtitle: String?
    var description: String?
}

class PWViewController: UIViewController, CardSliderDataSource {
    var data = [Item]()
    
    @IBOutlet weak var myName: UILabel!
    @IBOutlet weak var welcomeView1: UITextView!
    @IBOutlet weak var welcomeView2: UITextView!
    @IBOutlet weak var showButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let elm = Animal.list
        let mirror = Mirror(reflecting: elm)
        for child in mirror.children  {
            print(child.value)
            data.append(Item( image: UIImage(systemName: "heart.fill")!, title: child.value as! String , rating: 4, subtitle: "test", description: "test"))
            
        }
        
        guard let dataSource = self as? CardSliderDataSource else{
            return
        }
        
        let vc = CardSliderViewController.with(dataSource: self)
        vc.title = "Welcome!"
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true)

        
//        welcomeView1.font = UIFont(name: "circular-std-medium-500", size: 24)
//        welcomeView2.font = UIFont(name: "circular-std-medium-500", size: 24.0)
//        welcomeView2.font = welcomeView2.font?.withSize(24)
    
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        print("clicked")
    }
    
    func item(for index: Int) -> CardSliderItem {
        return data[index]
    }
    
    func numberOfItems() -> Int {
        return data.count
    }
}
