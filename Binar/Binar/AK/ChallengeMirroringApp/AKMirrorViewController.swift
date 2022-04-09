//
//  AKMirrorViewController.swift
//  Binar
//
//  Created by Adrian K on 03/04/22.
//

import UIKit

final class AKMirrorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var prabayarLabel: UILabel!
    var name: String?
    var selectedService: Services?
    var displayedService: [Services] = Services.listService()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.setHidesBackButton(true, animated: true)
        tableView.delegate = self
        tableView.dataSource = self
        numberLabel.text = "62812345678"
        dateLabel.text = "22/06/2026"
        prabayarLabel.text = "PRABAYAR"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let serviceCount: Int = displayedService.count
        return serviceCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "serviceIdentifier", for: indexPath)
        
        let row: Int = indexPath.row
        let challenge: Services = displayedService[row]
        cell.textLabel?.text = challenge.name
        
        return cell
    }
    
}

struct Services: Decodable {
    var name: String
//    let photoUrlString: String
    
    init(name: String, url: String){
        self.name = name
//        self.photoUrlString = url
    }
    static func listService() -> [Services] {
        let json =
        """
        [
            {
                "name": "Riwayat transaksi",
            },
            {
                "name": "Profil Saya",
            },
            {
                "name": "H3Y Star",
            },
            {
                "name": "3FrontLiners",
            },
            {
                "name": "Pengaturan",
            },
            {
                "name": "Keluar",
            }
        ]
        """
        do {
            let jsonData = Data(json.utf8)
            let service: [Services] = try JSONDecoder().decode([Services].self, from: jsonData)
            return service
        } catch {
            print(String(describing: error))
            return []
        }
    }
}
