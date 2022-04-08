//
//  TSAnimalTableViewController.swift
//  Binar
//
//  Created by Tatang Sulaeman on 25/03/22.
//

import UIKit

class TSAnimalTableViewController: UITableViewController {
    
    @IBOutlet weak var TSAnimaltableView: UITableView!
    var selectedAnima: Animal?
    var displayedAnimal: [Animal] = Animal.listV2()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TSAnimaltableView.registerCell(TSAnimalTableCell.self)
        TSAnimaltableView.delegate = self
        TSAnimaltableView.dataSource = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let animalCount: Int = displayedAnimal.count
        return animalCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reusableCell: UITableViewCell = tableView.dequeueReusableCell(
            withIdentifier: "TSAnimalTableCell",
            for: indexPath
        )
        
        guard let cell = reusableCell as? TSAnimalTableCell else {
            return reusableCell
        }
        
        let row: Int = indexPath.row
        let animal: Animal = displayedAnimal[row]
        
        cell.fill(with: animal)
        
        return cell
    }

    // MARK: - Table view data source

    

}

