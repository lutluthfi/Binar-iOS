//
//  ARSecondViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 31/03/22.
//

import UIKit

final class ARSecondViewController: UITableViewController {
    typealias DidSelectStudent = (Student) -> Void
    
    var didSelectStudent: DidSelectStudent?
    
    private var selectedStudent: Student?
    
    deinit {
        print("ARSecondViewController --- deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfStudent: Int = Student.sorted.count
        return numberOfStudent
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let row: Int = indexPath.row
        let studentName: String = Student.sorted[row].name
        cell.textLabel?.text = studentName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        
        let row: Int = indexPath.row
        selectedStudent = Student.sorted[row]
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
    }
    
    private func setupTableView() {
        tableView.registerCell(UITableViewCell.self)
    }
    
    private func setupNavigationBar() {
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(onDoneButtonTap)
        )
        navigationItem.rightBarButtonItems = [doneButton]
    }
    
    @objc private func onDoneButtonTap(_ sender: UIBarButtonItem) {
        guard let _selectedStudent = selectedStudent else {
            return
        }
        didSelectStudent?(_selectedStudent)
        navigationController?.popViewController(animated: true)
    }
}
