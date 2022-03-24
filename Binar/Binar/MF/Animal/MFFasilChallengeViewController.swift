//
//  FasilChallenge.swift
//  Binar
//
//  Created by Maulana Frasha on 17/03/22.
//

import UIKit

final class MFFasilChallengeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, StoryboardInstantiable{
    
    var animalList: [Animal]  = Animal.listV2()
    @IBOutlet weak var tableView: UITableView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCell(MFAnimalTableCell.self)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseCell = tableView.dequeueReusableCell(withIdentifier: "MFAnimalTableCell", for: indexPath) as! MFAnimalTableCell
        
        let animal: Animal = animalList[indexPath.row]
        reuseCell.cellData(with: animal)
        return reuseCell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let swipeDelete = UIContextualAction(style: .destructive, title: "Delete") { action, view, completion in
            self.animalList.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
        let swipeUpdate = UIContextualAction(style: .normal, title: "Update") { action, view, completion in
            self.updateJSON()
            tableView.reloadData()
        }
        
        let config = UISwipeActionsConfiguration(actions: [swipeDelete, swipeUpdate])
        return config
    }

    func updateJSON(){
        
        let alert = UIAlertController(title: "Change Name", message: "\n Input a new name.", preferredStyle: .alert)
        alert.addTextField(configurationHandler: { textField in
            textField.textAlignment = .center
        })
        
        alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { action in
            let inputNama = alert.textFields![0]
            self.animalList.append(Animal(name: inputNama.text!, photoUrlString: "", description: "Deskripsi", typeOfFood: .carnivora, strength: 1))
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(alert, animated: true)
    }
}
