//
//  ZKViewController.swift
//  Binar
//
//  Created by karen syah on 17/03/22.
//

import UIKit

final class ZKViewController: UITableViewController {

    var name: String?
    var selectedAnimal: Animal?
    
    var displayedAnimal: [String] = Animal.list.sorted()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            let displayedAnimal : Int = displayedAnimal.count
              return displayedAnimal
          }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath)

            cell.textLabel?.text = displayedAnimal[indexPath.row]

            return cell
        }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
