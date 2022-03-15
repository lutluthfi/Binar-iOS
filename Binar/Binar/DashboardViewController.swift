//
//  ViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 11/03/22.
//

import UIKit

final class DashboardViewController: UITableViewController {
    var selectedStudent: Student?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let studentCount: Int = Student.sorted.count
        return studentCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentTableCell", for: indexPath)
        
        let row: Int = indexPath.row
        let student: Student = Student.sorted[row]
        cell.textLabel?.text = student.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row: Int = indexPath.row // selected row
        selectedStudent = Student.sorted[row] // get Student from sorted at number of row
        switch selectedStudent {
        case .ArifLuthfi:
            goToARViewController()
        case .TioHardadi:
            goToARViewController()
        default:
            break
        }
    }
}

// MARK: goToARViewController
extension DashboardViewController {
    func goToARViewController() {
        guard let selectedStudet = selectedStudent else { return }
        let storyboard = UIStoryboard(name: "ARMain", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "ARViewController") as? ARViewController else {
            return
        }
        viewController.name = selectedStudet.name
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: goToTHViewController
extension DashboardViewController {
    func goToTHViewController() {
        guard let selectedStudet = selectedStudent else { return }
        let storyboard = UIStoryboard(name: "THMain", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "THViewController") as? THViewController else {
            return
        }
        viewController.name = selectedStudet.name
        navigationController?.pushViewController(viewController, animated: true)
    }
}