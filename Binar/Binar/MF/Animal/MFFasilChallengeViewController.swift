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

}


