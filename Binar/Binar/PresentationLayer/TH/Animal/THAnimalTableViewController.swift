//
//  THAnimalTableTableViewController.swift
//  Binar
//
//  Created by Tio Hardadi Somantri on 3/25/22.
//

import UIKit

final class THAnimalTableViewController: UITableViewController, StoryboardInstantiable {
    var animalList: [Animal] = Animal.listV2()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNibCell(THAnimalTableCell.self)
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reusableCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "THAnimalTableCell", for: indexPath)
        
        guard let cell = reusableCell as? THAnimalTableCell else {
            return reusableCell
        }
        
        let animal: Animal = animalList[indexPath.row]
        cell.fill(with: animal)
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let  viewController =  THDetailAnimalViewController(nibName:"THDetailAnimalViewController",bundle:Bundle.main)
        viewController.animal = animalList[indexPath.row]
        let navigation  = UINavigationController(rootViewController:viewController)
        self.present(navigation, animated: true, completion: nil)
 
    }


}
