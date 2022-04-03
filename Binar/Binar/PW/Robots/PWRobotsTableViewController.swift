//
//  PWRobotsTableViewController.swift
//  Binar
//
//  Created by user on 25/03/22.
//

import Foundation
import UIKit

class PWRobotsTableViewController: UIViewController, UITableViewDataSource, StoryboardInstantiable{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    @IBOutlet weak var tableView2: UITableView!
    
    
    var displayedAnimals: [Animal] = Animal.listV2()
    var selectedAnimal: Animal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Animal List"
        tableView2.dataSource = self
        tableView2.registerCell(RobotsTableViewCell.self)
        let elm = Animal.listV2()
        let mirror = Mirror(reflecting: elm)
        for child in mirror.children  {
          print(child)
        }
    }
}
    

