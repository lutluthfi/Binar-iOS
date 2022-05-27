//
//  DBViewController.swift
//  Binar
//
//  Created by Muhammad dhani Bukhory on 04/04/22.
//
import LocalAuthentication
import UIKit
import Alamofire


let context = LAContext()
enum Binar: String, CaseIterable, TitleEnum {
case AnimalCellChallenge
    case DBBrowser
case DBPDF
    case FavoriteMusic
  
static var sorted: [Binar] {
    Binar.allCases.sorted {
        $0.rawTitle < $1.rawTitle
    }.map { $0 }
}
}

final class DBViewController: UITableViewController, StoryboardInstantiable {
private let name: String

required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}

init(name: String) {
    self.name = name
    super.init(nibName: nil, bundle: nil)
}

override func viewDidLoad() {
    super.viewDidLoad()
    tableView.registerCell(UITableViewCell.self)
}

// MARK: TableViewDataSource
override func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
) -> Int {
    let numberOfBinar: Int = Binar.sorted.count
    return numberOfBinar
}

override func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
) -> UITableViewCell {
    let cell: UITableViewCell = tableView.dequeueReusableCell(
        withIdentifier: "UITableViewCell",
        for: indexPath)
    
    let row: Int = indexPath.row
    let titleBinar: String = Binar.sorted[row].rawTitle
    cell.textLabel?.text = titleBinar
    return cell
}
  func detectFaceID(){
        let context = LAContext()
        context.localizedFallbackTitle = "Masukkan passcode"
        
        var authError: NSError?
        let reason = "Dibutuhkan autentikasi untuk mengakses data"
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authError) {
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { (success, error) in
                
                if success {
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "Success", message: "Berhasil", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                } else {
                    guard error != nil else {
                        return
                    }
                    print(error!)
                }
            }
        } else {
            guard authError != nil else {
                return
            }
            print(authError!)
        }
    }
// MARK: TableViewDelegate
override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let row: Int = indexPath.row
    let binar: Binar = Binar.sorted[row]
    switch binar {
    case .AnimalCellChallenge:
        open(DBChallenge3TableViewController())
    case .DBBrowser:
        open(DBWebViewController())
    case .DBPDF:
        open(DBPDFViewController())
    case .FavoriteMusic:
        open(DBFavoriteMusicViewController())
    }
}

private func open(_ viewController: UIViewController) {
    navigationController?.pushViewController(viewController, animated: true)
}
}


