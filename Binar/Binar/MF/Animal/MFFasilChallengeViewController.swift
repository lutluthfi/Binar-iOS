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
        
        let config = UISwipeActionsConfiguration(actions: [swipeDelete])
        return config
    }
    
    @IBAction func addDataTap(_ sender: UIButton) {
        addData()
    }
    

    func addData(){
        
        let alert = UIAlertController(title: "Input new data", message: "\n Input a new name.", preferredStyle: .alert)
    
        alert.addTextField(configurationHandler: { nameTextField in
            nameTextField.placeholder = "Input Nama"
            nameTextField.textAlignment = .center
        })
        alert.addTextField { descTextField in
            descTextField.placeholder = "Input Desc"
            descTextField.textAlignment = .center
        }
        
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { action in
            let inputNama = alert.textFields![0]
            let inputDesc = alert.textFields![1]
            let randomTypeFood = Animal.TypeOfFood.allCases.randomElement()
            let randomInt = Int.random(in: 0...100)
            self.animalList.append(Animal(name: String(inputNama.text!), photoUrlString: "https://picsum.photos/200", description: (inputDesc.text!), typeOfFood: randomTypeFood!, strength: randomInt))
            self.tableView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(alert, animated: true)
    }
}
