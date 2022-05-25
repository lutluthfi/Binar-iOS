//
//  IGSignInViewController.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 24/05/22.
//

import AuthenticationServices
import GoogleSignIn
import UIKit

final class IGSignInViewController: LiteTableViewController {
    private(set) var appleFullName: PersonNameComponents?
    private(set) var appleEmail: String?
    private(set) var appleUserId: String?
    var isSignedInWithApple: Bool {
        let userIdNotNil: Bool = appleUserId != nil
        return userIdNotNil
    }
    
    private(set) var googleFullName: String?
    private(set) var googleEmail: String?
    private(set) var googleUserId: String?
    var isSignedInWithGoogle: Bool {
        let fullNameNotNil: Bool = googleFullName != nil
        let emailNotNil: Bool = googleEmail != nil
        let userIdNotNil: Bool = googleUserId != nil
        return fullNameNotNil && emailNotNil && userIdNotNil
    }
    
    let googleSignInConfig = GIDConfiguration(clientID: "48376795055-jqoiof6i5ac3vp0a9hu5jrrunds0lkan.apps.googleusercontent.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTableView {
            // MARK: Sign in With Apple
            loadCell { (cell: TableCell<UILabel>, _) in
                cell.content.font = .preferredFont(forTextStyle: .title2)
                cell.content.text = "Sign In with Apple"
                cell.padding = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
            }
            loadCell { [weak self] (cell: TableCell<UILabel>, _) in
                guard let _self = self else { return }
                let text: String =
                """
                Full name: \(String(describing: _self.appleFullName))\n
                Email: \(String(describing: _self.appleEmail))\n
                User ID: \(String(describing: _self.appleUserId))
                """
                cell.content.text = text
                cell.content.numberOfLines = 0
                if _self.isSignedInWithApple {
                    cell.padding = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
                } else {
                    cell.padding = UIEdgeInsets(top: 0, left: 20, bottom: 5, right: 20)
                }
            }
            loadCell { [weak self] (cell: TableCell<ASAuthorizationAppleIDButton>, _) in
                guard let _self = self else { return }
                cell.content.addTarget(self, action: #selector(_self.onAppleAuthButtonTap), for: .touchUpInside)
                cell.padding = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
                if _self.isSignedInWithApple {
                    cell.setHeight(0)
                } else {
                    cell.setHeight(44)
                }
            }
            loadCell { (cell: TableCell<UIView>, _) in
                cell.setHeight(5)
                cell.content.backgroundColor = .systemGray
            }
            
            // MARK: Sign in With Google
            loadCell { (cell: TableCell<UILabel>, _) in
                cell.content.font = .preferredFont(forTextStyle: .title2)
                cell.content.text = "Sign In with Google"
                cell.padding = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
            }
            loadCell { [weak self] (cell: TableCell<UILabel>, _) in
                guard let _self = self else { return }
                let text: String =
                """
                Full name: \(String(describing: _self.googleFullName))\n
                Email: \(String(describing: _self.googleEmail))\n
                User ID: \(String(describing: _self.googleUserId))
                """
                cell.content.text = text
                cell.content.numberOfLines = 0
                if _self.isSignedInWithGoogle {
                    cell.padding = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
                } else {
                    cell.padding = UIEdgeInsets(top: 0, left: 20, bottom: 5, right: 20)
                }
            }
            loadCell { [weak self] (cell: TableCell<GIDSignInButton>, _) in
                guard let _self = self else { return }
                cell.content.addTarget(self, action: #selector(_self.onGoogleAuthButtonTap), for: .touchUpInside)
                cell.padding = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
                if _self.isSignedInWithGoogle {
                    cell.setHeight(0)
                } else {
                    cell.setHeight(44)
                }
            }
            loadCell { (cell: TableCell<UIView>, _) in
                cell.setHeight(5)
                cell.content.backgroundColor = .systemGray
            }
        }
    }
    
    @objc private func onAppleAuthButtonTap() {
        let provider = ASAuthorizationAppleIDProvider()
        let request: ASAuthorizationAppleIDRequest = provider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    @objc private func onGoogleAuthButtonTap() {
        GIDSignIn.sharedInstance.signIn(with: googleSignInConfig, presenting: self) { [weak self] user, error in
            guard let _user = user, let _profile = _user.profile else { return }
            
            self?.googleFullName = _profile.name
            self?.googleEmail = _profile.email
            self?.googleUserId = _user.userID
            
            self?.reloadTableView()
        }
    }
}

extension IGSignInViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Failed Authorization Apple ID caused by \(String(describing: error))")
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        let credential: ASAuthorizationCredential = authorization.credential
        switch credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            appleUserId = appleIDCredential.user
            appleFullName = appleIDCredential.fullName
            appleEmail = appleIDCredential.email
            
            reloadTableView()
        case let passwordCredential as ASPasswordCredential:
            let username: String = passwordCredential.user
            let password: String = passwordCredential.password
            
            print(">>> Password Credential >> username: \(username)")
            print(">>> Password Credential >> username: \(password)")
            reloadTableView()
        default:
            break
        }
    }
}

extension IGSignInViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        view.window!
    }
}

// 48376795055-jqoiof6i5ac3vp0a9hu5jrrunds0lkan.apps.googleusercontent.com
// com.googleusercontent.apps.48376795055-jqoiof6i5ac3vp0a9hu5jrrunds0lkan
