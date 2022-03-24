//
//  BIAnimalTableViewController.swift
//  Binar
//
//  Created by Bagas on 25/03/22.
//

import UIKit

final class BIAnimalTableViewController: UITableViewController, StoryboardInstantiable {
    var displayedAnimals: [Animal] = Animal.listV2()
    var selectedAnimal: Animal?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCell(BIAnimalTableCell.self)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count: Int = displayedAnimals.count
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reusableCell: UITableViewCell = tableView.dequeueReusableCell(
            withIdentifier: "BIAnimalTableCell",
            for: indexPath
        )
        
        guard let cell = reusableCell as? BIAnimalTableCell else {
            return reusableCell
        }
        
        let row: Int = indexPath.row
        let animal: Animal = displayedAnimals[row]
        
        cell.fill(with: animal)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row: Int = indexPath.row
        selectedAnimal = displayedAnimals[row]
        for animal in Animal.listV2() {
            switch selectedAnimal?.name{
            case animal.name:
                guard let selectedAnimal = selectedAnimal else { return }
                let storyboard = UIStoryboard(name: "BIMain", bundle: nil)
                guard let viewController = storyboard.instantiateViewController(withIdentifier: "AnimalDetail") as? AnimalDetail else {return}
                viewController.name = selectedAnimal.name
                viewController.desc = selectedAnimal.description
                viewController.imageUrlString = selectedAnimal.photoUrlString
                navigationController?.pushViewController(viewController, animated: true)

            default:
            break
            }
        }
    }
}
