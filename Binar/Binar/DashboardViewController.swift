//
//  ViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 11/03/22.
//

import UIKit

final class DashboardViewController: UITableViewController {
    var selectedStudent: Student?
    
    var displayedStudents: [Student] = Student.sorted
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let studentCount: Int = displayedStudents.count
        return studentCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentTableCell", for: indexPath)
        
        let row: Int = indexPath.row
        let student: Student = displayedStudents[row]
        cell.textLabel?.text = student.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row: Int = indexPath.row // selected row
        selectedStudent = displayedStudents[row] // get Student from sorted at number of row
        switch selectedStudent {
        case .ArifLuthfi:
            goToARViewController()
        case .TioHardadi:
            goToTHViewController()
        case .MaulanaFrasha:
            goToMFVC()
        case .AdrianKurniawan:
            goToAKViewController()
        case .AiedylDava:
            goToADViewController()
        case .PranaApsara:
            goToPWViewController()
        case .RadenDimas:
            goToRDViewController()
        case .DimasPurnomo:
            goToDPViewController()
        case .TatangSulaeman:
            goToTSViewController()
        case .Daffashiddiq:
            goToDSViewController()
        case .AdjiFirmansyah:
            goToAFViewController()
        case .BagasIlham:
            goToBIViewController()
        default:
            break
        }
    }
}

extension DashboardViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        tableView.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let _searchText: String = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        let isSearchTextNotEmpty = !_searchText.isEmpty
        let students: [Student] = Student.sorted
        if isSearchTextNotEmpty {
            let searchedStudents: [Student] = students.filter {
                let _searchText: String = searchText.lowercased()
                let _name: String = $0.name.lowercased()
                return _name.contains(_searchText)
            }
            displayedStudents = searchedStudents
        } else {
            displayedStudents = students
        }
        tableView.reloadData()
    }
}

// MARK: goToARViewController
extension DashboardViewController {
    func goToARViewController() {
        guard let selectedStudent = selectedStudent else { return }
        let storyboard = UIStoryboard(name: "ARMain", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "ARViewController") as? ARViewController else {
            return
        }
        viewController.name = selectedStudent.name
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: goToTHViewController
extension DashboardViewController {
    func goToTHViewController() {
        guard let selectedStudent = selectedStudent else { return }
        let storyboard = UIStoryboard(name: "THMain", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "THViewController") as? THViewController else {
            return
        }
        viewController.name = selectedStudent.name
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: goToPWViewController
extension DashboardViewController{
    func goToPWViewController() {
        let storyboard = UIStoryboard(name: "PWMain", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "PWViewController") as? PWViewController else{
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}


extension DashboardViewController {
    func goToMFVC() {
        guard let selectedStudent = selectedStudent else { return }
        let storyboard = UIStoryboard(name: "MFMain", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "MFViewController") as? MFViewController else {
            return
        }
        viewController.name = selectedStudent.name
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: goToAKViewController
extension DashboardViewController {
    func goToAKViewController() {
        guard let selectedStudent = selectedStudent else { return }
        let storyboard = UIStoryboard(name: "AKMain", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "AKViewController") as? AKViewController else {
            return
        }
        viewController.name = selectedStudent.name
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension DashboardViewController {
    func goToADViewController() {
        guard let selectedStudent = selectedStudent else { return }
        let storyboard = UIStoryboard(name: "ADMain", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "ADViewController") as? ADViewController else {
            return
        }
        viewController.name = selectedStudent.name
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: goToRDViewController
extension DashboardViewController {
    func goToRDViewController() {
        guard let selectedStudent = selectedStudent else { return }
        let viewController = RDViewController()
        viewController.name = selectedStudent.name
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: goToDPViewController
extension DashboardViewController {
    func goToDPViewController() {
        guard let selectedStudent = selectedStudent else { return }
        let storyboard = UIStoryboard(name: "DPMain", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "DPViewController") as? DPViewController else {
            return
        }
        viewController.name = selectedStudent.name
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: goToTSViewController
extension DashboardViewController {
    func goToTSViewController() {
        let storyboard = UIStoryboard(name: "TSMain", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "TSViewController") as? TSViewController else {
            return
        }

        navigationController?.pushViewController(viewController, animated: true)
    }
}


// MARK: goToDSViewController
extension DashboardViewController {
    func goToDSViewController() {
        let storyboard = UIStoryboard(name: "DSMain", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "DSViewController") as? DSViewController else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension DashboardViewController {
    func goToAFViewController() {
        guard let selectedStudent = selectedStudent else { return }
        let storyboard = UIStoryboard(name: "AFMain", bundle: nil)
        
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "AFViewController") as? AFViewController else { return }
        viewController.name = selectedStudent.name
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
        
// MARK: goToBIViewController
extension DashboardViewController {
    func goToBIViewController() {
        guard let selectedStudent = selectedStudent else { return }
        let storyboard = UIStoryboard(name: "BIMain", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "BIViewController") as? BIViewController else {
            return
        }
        viewController.name = selectedStudent.name
        navigationController?.pushViewController(viewController, animated: true)
    }
}
