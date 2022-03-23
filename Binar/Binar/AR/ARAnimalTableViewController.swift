//
//  ARAnimalTableViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 23/03/22.
//

import UIKit

final class ARAnimalTableViewController: UITableViewController, StoryboardInstantiable {
    var displayedAnimals: [Animal] = Animal.listV2()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count: Int = displayedAnimals.count
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalTableCell", for: indexPath)
        
        let row: Int = indexPath.row
        let animal: Animal = displayedAnimals[row]
        
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = animal.name
        cell.detailTextLabel?.text = animal.description
        cell.imageView?.loadImage(resource: animal.photoUrlString)
        
        return cell
    }
}
