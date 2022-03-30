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
        tableView.registerCell(ARAnimalTableCell.self)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count: Int = displayedAnimals.count
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reusableCell: UITableViewCell = tableView.dequeueReusableCell(
            withIdentifier: "ARAnimalTableCell",
            for: indexPath
        )
        
        guard let cell = reusableCell as? ARAnimalTableCell else {
            return reusableCell
        }
        
        let row: Int = indexPath.row
        let animal: Animal = displayedAnimals[row]
        
        cell.fill(with: animal)
        
        return cell
    }
}
