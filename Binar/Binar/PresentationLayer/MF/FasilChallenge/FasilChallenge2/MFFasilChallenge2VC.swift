//
//  FasilChallenge4.swift
//  Binar
//
//  Created by Maulana Frasha on 01/04/22.
//

import UIKit

final class MFFasilChallenge2VC: UIViewController, UITableViewDataSource, UITableViewDelegate, StoryboardInstantiable {
    
    var animalList: [Animal]  = Animal.listV2()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Table View CRUD"
    
        addButtonOutlet.layer.cornerRadius = 10
        addButtonOutlet.backgroundColor = .systemGray6
        addButtonOutlet.setImage(UIImage(systemName: "plus"), for: .normal)
        addButtonOutlet.setTitle(" Add Data", for: .normal)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerNibCell(MFTableCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseCell = tableView.dequeueReusableCell(withIdentifier: "MFTableCell", for: indexPath) as! MFTableCell
        
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
    
    @IBAction func addButtonTap(_ sender: Any) {
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
            self.animalList.append(Animal(name: (inputNama.text!), desc: (inputDesc.text!), strength: randomInt, url: "https://picsum.photos/200", food: randomTypeFood!))
            self.tableView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(alert, animated: true)
    }
    
    
}

