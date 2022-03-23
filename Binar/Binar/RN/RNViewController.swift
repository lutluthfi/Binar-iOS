import UIKit

final class RNViewController: UITableViewController {
    
    var name : String?
    var listAnimals: [String] = Animal.list.sorted()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let displayAnimals : Int = listAnimals.count
          return displayAnimals
      }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalTableCell", for: indexPath)

        cell.textLabel?.text = listAnimals[indexPath.row]
        
        return cell
    }

}
