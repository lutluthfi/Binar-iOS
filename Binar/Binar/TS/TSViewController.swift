//
//  TSViewController.swift
//  Binar
//
//  Created by Tatang Sulaeman on 15/03/22.
//

import UIKit

class TSViewController: UIViewController {

    @IBOutlet weak var animalTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animalTable.delegate = self
        animalTable.dataSource = self
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

extension TSViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Animal.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = animalTable.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath)
        cell.textLabel!.text = Animal.list[indexPath.row]
        return cell
    }
    
    
}
