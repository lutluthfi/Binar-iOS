//
//  DMViewController.swift
//  Binar
//
//  Created by erin joseph on 22/03/22.
//

import UIKit

class DMViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var name: String?
    var displayAnimal: [String] = Animal.list
    var animalSectionTitles = [String]()
    var animalDictionary = [String:[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
        
        for animal in displayAnimal {
            let animalKey = String(animal.prefix(1))
            print(animalKey)
            if var animalValues = animalDictionary[animalKey]{
                animalValues.append(animal)
                animalDictionary[animalKey] = animalValues
            } else {
                animalDictionary[animalKey] = [animal]
            }
        }
        
        
        animalSectionTitles = [String](animalDictionary.keys)
        animalSectionTitles = animalSectionTitles.sorted(by: {$0 < $1})
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension DMViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tes")
    }
}

extension DMViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return animalSectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let animalKey = animalSectionTitles[section]
        if let animalValues = animalDictionary[animalKey]{
            return animalValues.count
        }
        return displayAnimal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let animalKey = animalSectionTitles[indexPath.section]
        
        
        
        if let animalValues = animalDictionary[animalKey]{
            cell.textLabel?.text = animalValues[indexPath.row]
            cell.textLabel?.font = UIFont(name: "", size: 18)
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return animalSectionTitles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return animalSectionTitles
    }
    
}
