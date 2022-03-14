//
//  ViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 11/03/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    var isUsernameEmpty: Bool {
        let username: String = usernameTextField.text ?? ""
        let trimmedUsername: String = username.trimmingCharacters(in: .whitespacesAndNewlines)
        let isUsernameEmpty: Bool = trimmedUsername.isEmpty
        return isUsernameEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onSignInButtonTap(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case is NextViewController:
            let viewController = segue.destination as? NextViewController
            prepareForNextViewController(viewController)
        default:
            break
        }
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch identifier {
        case "goToNext":
            return goToNextViewContollerIfPassed()
        default:
            return true
        }
    }
    
    func goToNextViewContollerIfPassed() -> Bool {
        if isUsernameEmpty {
            let alert = UIAlertController(title: "Sign In Alert", message: "User name could not be empty", preferredStyle: .alert)
            let okAlertAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAlertAction)
            present(alert, animated: true)
            return false
        }
        return true
    }
    
    func prepareForNextViewController(_ viewController: NextViewController?) {
        let username: String = usernameTextField.text ?? ""
        viewController?.username = username
    }
}

class NextViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UILabel!
    
    var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = username
    }
}

// UINavigationController = Toples

// Biskuit 1
// Biskuit 2
// Biskuit 3
// Paling bawah
