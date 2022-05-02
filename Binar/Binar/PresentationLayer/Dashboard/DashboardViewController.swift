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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
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
        case .NuzululAthaya:
            goToATViewController()
        case .Daffashiddiq:
            goToDSViewController()
        case .AdjiFirmansyah:
            goToAFViewController()
        case .BagasIlham:
            let choiceAlert = UIAlertController(title: "Gate to other universe🌌", message: "Where do you wanna go?", preferredStyle: .alert)
            
            let challenge1 = UIAlertAction(title: "Challenge 1", style: .default) { _ in
                self.goToBI1()
            }
            
            let challenge2 = UIAlertAction(title: "Challenge 2", style: .default) { _ in
                self.goToBI2()
            }
            
            let challenge3 = UIAlertAction(title: "Challenge 3", style: .default) { _ in
                self.goToBI3()
            }
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            choiceAlert.addAction(challenge1)
            choiceAlert.addAction(challenge2)
            choiceAlert.addAction(challenge3)
            choiceAlert.addAction(cancel)
            
            present(choiceAlert, animated: true)
        case .NurinBerlianna:
            goToNBViewController()
        case .AkbarIdris:
            goToAIViewController()
        case .RandySetiawan:
            goToRNViewController()
        case .DhaniBukhory:
            goToDBViewController()
        case .Instagram:
            let viewController = IGTabBarController()
            navigationController?.setNavigationBarHidden(true, animated: true)
            navigationController?.pushViewController(viewController, animated: true)
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
        guard let student = selectedStudent else { return }
        let studentName: String = student.name
        let viewController = ARViewController(name: studentName)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: goToTHViewController
extension DashboardViewController {
    func goToTHViewController() {
//        guard let selectedStudent = selectedStudent else { return }
//        let storyboard = UIStoryboard(name: "THMain", bundle: nil)
//        guard let viewController = storyboard.instantiateViewController(withIdentifier: "THViewController") as? THViewController else {
//            return
//        }
//        viewController.name = selectedStudent.name
        guard let viewController = THAnimalTableViewController.initViewController(from: "THMain") else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: goToPWViewController
extension DashboardViewController{
    func goToPWViewController() {
        guard let viewController = PWViewController.initViewController(from: "PWMain") else{
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
        let viewController = RDTabbarViewController()
//        let viewController = InstagramLikesLabelController()
        navigationController?.isNavigationBarHidden = true
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
    func goToBI1() {
        guard let selectedStudent = selectedStudent else { return }
        let storyboard = UIStoryboard(name: "BIMain", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "BIViewController") as? BIViewController else {
            return
        }
        viewController.name = selectedStudent.name
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func goToBI2() {
        guard let viewController = BIAnimalTableViewController.initViewController(from: "BIMain") else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func goToBI3() {
        let storyboard = UIStoryboard(name: "BIMain", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "BIChallengeViewController") as? BIChallengeViewController else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: goToATViewController
extension DashboardViewController{
    func goToATViewController(){
        guard let selectedStudent = selectedStudent else {return}
        let storyboard = UIStoryboard(name: "ATMain", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "ATViewController") as? ATViewController else{
            return
        }
        viewController.name = selectedStudent.name
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: goToAIViewController
extension DashboardViewController {
    func goToAIViewController() {
        guard selectedStudent != nil else { return }
        let storyboard = UIStoryboard(name: "AIMain", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "AIAnimalTableViewController") as? AIAnimalTableViewController else {
            return
        }

        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: goToNBViewController
extension DashboardViewController {
    func goToNBViewController() {
        let storyboard = UIStoryboard(name: "NBMain", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "NBViewController") as? NBViewController else {
            return
        }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: goToRNViewController
extension DashboardViewController{
    func goToRNViewController(){
        guard let selectedStudent = selectedStudent else {return}
        let storyboard = UIStoryboard(name: "RNMain", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "RNViewController") as? RNViewController else{
            return
        }
        viewController.name = selectedStudent.name
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension DashboardViewController {
    func goToDBViewController() {
        guard let student = selectedStudent else { return }
        let studentName: String = student.name
        let viewController = DBViewController(name: studentName)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
