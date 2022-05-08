//
//  DPViewController.swift
//  Binar
//
//  Created by Dimas Purnomo on 25/04/22.
//

import UIKit

class DPViewController: UITableViewController, StoryboardInstantiable {
    
    enum Course: String, CaseIterable, TitleEnum {
        case Challenge2Fasilitator
        case Challenge3Course
        case Challenge4CourseAndChallenge3Fasilitator
        case Challenge5Course
        
        static var sorted: [Course] {
            Course.allCases.sorted {
                $0.rawTitle < $1.rawTitle
            }.map { $0 }
        }
    }
    
    private let name: String
    
    init(name: String) {
        self.name = name
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCell(UITableViewCell.self)
        title = self.name + " Challenge"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfCourse: Int = Course.sorted.count
        return numberOfCourse
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let row: Int = indexPath.row
        let titleCourse: String = Course.sorted[row].rawTitle
        cell.textLabel?.text = titleCourse
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row: Int = indexPath.row
        let course: Course = Course.sorted[row]
        switch course {
        case .Challenge2Fasilitator:
            let storyboard = UIStoryboard(name: "DPChapter2Main", bundle: nil)
            guard let viewController = storyboard.instantiateViewController(withIdentifier: "DPAnimalChallengeCapther2ViewController") as? DPAnimalChallengeCapther2ViewController else { return }
            open(viewController)
        case .Challenge3Course:
            let storyboard = UIStoryboard(name: "DPChapter3Main", bundle: nil)
            guard let viewController = storyboard.instantiateViewController(withIdentifier: "DPChapter3ViewController") as? DPChapter3ViewController else { return }
            open(viewController)
        case .Challenge4CourseAndChallenge3Fasilitator:
            let storyboard = UIStoryboard(name: "DPChapter4Main", bundle: nil)
            guard let viewController = storyboard.instantiateViewController(withIdentifier: "DPChapter4ViewController") as? DPChapter4ViewController else { return }
            open(viewController)
        case .Challenge5Course:
            open(DPChapther5ViewController())
        
    }
    
}
    
    
    private func open(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }



    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
