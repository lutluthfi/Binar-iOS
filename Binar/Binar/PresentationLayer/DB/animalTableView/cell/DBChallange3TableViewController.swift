//
//  DBChallange3TableViewController.swift
//  Binar
//
//  Created by Muhammad dhani Bukhory on 08/04/22.
//

import UIKit

class DBChallange3TableViewController: UITableViewController {
    var displayedAnimals: [Animal] = Animal.listV2()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNibCell(DBTableViewCell.self)
       
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count: Int = displayedAnimals.count
        return count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let reusableCell: UITableViewCell = tableView.dequeueReusableCell(
               withIdentifier: "DBTableViewCell",
               for: indexPath
           )
           
           guard let cell = reusableCell as? DBTableViewCell else {
               return reusableCell
           }
           
           let row: Int = indexPath.row
           let animal: Animal = displayedAnimals[row]
           
           cell.fill(with: animal)
           
           return cell
       }
   }
