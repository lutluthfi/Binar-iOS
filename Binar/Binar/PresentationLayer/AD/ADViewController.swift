//
//  ADViewController.swift
//  Binar
//
//  Created by Aiedyl Dava Akbari on 15/03/22.
//

import UIKit

class ADViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var name: String?
    var displayAnimal: [Animal] = Animal.listV2()
    

    @IBOutlet var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name

        let nib = UINib(nibName: "ADAnimalViewCellViewTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ADAnimalViewCellViewTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self


    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayAnimal.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let row: Int = indexPath.row
        let animal: Animal = displayAnimal[row]

        let reusableCell: UITableViewCell = tableView.dequeueReusableCell(
            withIdentifier: "ADAnimalViewCellViewTableViewCell",
            for: indexPath
        )

        guard let cell = reusableCell as? ADAnimalViewCellViewTableViewCell else {
            return reusableCell
        }

        cell.animalName.text = animal.name
        cell.animalImg.loadImage(resource: animal.photoUrlString)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ADAnimalViewController {
            destination.animal = Animal.listV2()[(tableView.indexPathForSelectedRow?.row)!]
        }
    }

}


