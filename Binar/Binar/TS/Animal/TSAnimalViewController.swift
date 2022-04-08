//
//  TSAnimalViewController.swift
//  Binar
//
//  Created by Tatang Sulaeman on 08/04/22.
//

import UIKit

class TSAnimalViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var selectedAnima: Animal?
    var displayedAnimal: [Animal] = Animal.listV2()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCell(TSAnimalTableCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
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

extension TSAnimalViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let animalCount: Int = displayedAnimal.count
        return animalCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
}
