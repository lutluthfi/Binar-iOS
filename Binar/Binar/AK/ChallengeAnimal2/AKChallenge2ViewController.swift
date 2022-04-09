//
//  AKChallenge2ViewController.swift
//  Binar
//
//  Created by Adrian K on 03/04/22.
//

import UIKit

final class AKChallenge2ViewController: UITableViewController, StoryboardInstantiable {
    var name: String?
    var selectedAnimal: Animal?
    
    var displayedAnimals: [Animal] = Animal.listV2()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNibCell(AKAnimalTableCell.self)
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count: Int = displayedAnimals.count
        return count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let row: Int = indexPath.row
        selectedAnimal = displayedAnimals[row]
        let controller = UIStoryboard(name: "AKMainChallenge2", bundle: nil).instantiateViewController(withIdentifier: "AKDetailViewController") as! AKDetailViewController
        controller.animalName = selectedAnimal?.name
        controller.animalUrl = selectedAnimal?.photoUrlString
        controller.animalDescription = selectedAnimal?.description
        controller.animalTipe = selectedAnimal?.typeOfFood
        controller.animalStat = selectedAnimal?.strength
        navigationController?.pushViewController(controller, animated: true)
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reusableCell: UITableViewCell = tableView.dequeueReusableCell(
            withIdentifier: "AKAnimalTableCell",
            for: indexPath
        )
        
        guard let cell = reusableCell as? AKAnimalTableCell else {
            return reusableCell
        }
        
        let row: Int = indexPath.row
        let animal: Animal = displayedAnimals[row]
        
        cell.fill(with: animal)
        
        return cell
    }
}

