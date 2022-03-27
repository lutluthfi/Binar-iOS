//
//  AnimalDetailViewControlller.swift
//  Binar
//
//  Created by Bagas on 25/03/22.
//

import UIKit

final class BIAnimalDetailViewController: UIViewController{
    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var animalDescLabel: UILabel!
    
    var name: String?
    var desc: String?
    var typeOfFood: Animal.TypeOfFood?
    var strength: Int?
    var imageUrlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name!.capitalized + " Detail"
        animalNameLabel.text = name
        animalDescLabel.text = desc! + "\n\n" +
        "Type of Food\t: \(typeOfFood!) \n" +
        "Strength\t\t: \(strength!)"
        animalImageView.loadImage(resource: imageUrlString)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}
//
//func handleEdit() {
//    lastStateDisplayedAnimals = displayedAnimals
//    let swipedAnimal = lastStateDisplayedAnimals![indexPath.row]
//    let editAlert = UIAlertController(title: "Edit Name", message: "Change this animal's name", preferredStyle: .alert)
//    
//    editAlert.addTextField()
//    let textField: UITextField = editAlert.textFields![0]
//    textField.text = swipedAnimal.name
//    
//    let confirm = UIAlertAction(title: "Confirm", style: .default) { [self] _ in
//        guard !textField.text!.isEmpty else {
//            let empty = UIAlertController(title: "Name is empty", message: "Please provide a name.", preferredStyle: .alert)
//            let ok = UIAlertAction(title: "OK", style: .default)
//            empty.addAction(ok)
//            present(empty, animated: true)
//            return handleEdit()
//        }
//        displayedAnimals[indexPath.row].name = textField.text!
//        lastStateDisplayedAnimals![indexPath.row].name = textField.text!
//        tableView.reloadData()
//    }
//    
//    let cancel = UIAlertAction(title: "Cancel", style: .destructive)
//    
//    editAlert.addAction(cancel)
//    editAlert.addAction(confirm)
//    present(editAlert, animated: true)
//}
