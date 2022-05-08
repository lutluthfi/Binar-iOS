//
//  DPChapter4ViewController.swift
//  Binar
//
//  Created by Dimas Purnomo on 08/05/22.
//

import UIKit

class DPChapter4ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var name: String?
    var selectedAnimal: Animal?
    
    var displayedAnimals: [Animal] = Animal.listV2()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Challenge4 Course"
        
        tableView.registerNibCell(DPCostumTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }

    
}

extension DPChapter4ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count: Int = displayedAnimals.count
        return count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let row: Int = indexPath.row
        selectedAnimal = displayedAnimals[row]
        let controller = UIStoryboard(name: "DPChapter4Main", bundle: nil).instantiateViewController(withIdentifier: "DPDetailViewController") as! DPDetailViewController
        controller.animalName = selectedAnimal?.name
        controller.animalUrl = selectedAnimal?.photoUrlString
        controller.animalDescription = selectedAnimal?.description
        controller.animalTipe = selectedAnimal?.typeOfFood
        controller.animalStat = selectedAnimal?.strength
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125 //return height size whichever you want
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reusableCell: UITableViewCell = tableView.dequeueReusableCell(
            withIdentifier: "DPCostumTableViewCell",
            for: indexPath
        )
        
        guard let cell = reusableCell as? DPCostumTableViewCell else {
            return reusableCell
        }
        
        let row: Int = indexPath.row
        let animal: Animal = displayedAnimals[row]
        
        cell.fill(with: animal)
        
        return cell
    }

}
