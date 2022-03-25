//
//  AnimalDetailViewControlller.swift
//  Binar
//
//  Created by Bagas on 25/03/22.
//

import UIKit

final class AnimalDetail: UIViewController{
    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var animalDescLabel: UILabel!
    
    var name: String?
    var desc: String?
    var imageUrlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name!.capitalized + " Detail"
        animalNameLabel.text = name
        animalDescLabel.text = desc
        animalImageView.loadImage(resource: imageUrlString)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}
