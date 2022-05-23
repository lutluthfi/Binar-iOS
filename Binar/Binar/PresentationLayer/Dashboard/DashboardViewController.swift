//
//  ViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 11/03/22.
//

import LocalAuthentication
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
            if #available(iOS 14.0, *) {
                goToBIListVC()
            } else {
                // Fallback on earlier versions
            }
        case .NurinBerlianna:
            goToNBViewController()
        case .AkbarIdris:
            goToAIViewController()
        case .RandySetiawan:
            goToRNViewController()
        case .DhaniBukhory:
            goToDBViewController()
        case .Instagram:
            let context = LAContext()
            var error: NSError?
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Identify yourself!"
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] (success, authenticationError) in
                    guard success else { return }
                    DispatchQueue.main.async {
                        self?.openInstagram()
                    }
                }
            } else {
                let alert = UIAlertController(title: "Biometry unavailable", message: "Your device is not configured for biometric authentication.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true)
            }
        default:
            break
        }
    }
    
    private func openInstagram() {
        let viewController = IGTabBarController()
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.pushViewController(viewController, animated: true)
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
//        guard let viewController = THAnimalTableViewController.initViewController(from: "THMain") else {
//            return
//        }
        navigationController?.pushViewController(THYoutubeTabBarViewController(), animated: true)
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
@available(iOS 14.0, *)
extension DashboardViewController {
    func goToBIListVC() {
        guard let _selectedStudent = selectedStudent else {return}
        let vc = BIListViewController(style: .insetGrouped)
        vc.title = _selectedStudent.name
        navigationController?.pushViewController(vc, animated: true)
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
