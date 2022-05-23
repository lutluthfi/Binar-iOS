//
//  DBWebViewController.swift
//  Binar
//
//  Created by Muhammad dhani Bukhory on 21/05/22.
//

import UIKit

class DBWebViewController: UIViewController {


        private let Button: UIButton =  {
            let Button = UIButton()
            Button.setTitle("Show DBWebPage", for: .normal)
            Button.backgroundColor = .link
            Button.setTitleColor(.white, for: .normal)
            return Button

        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.addSubview(Button)
            Button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
            Button.frame = CGRect (x: 0, y: 0, width: 220, height: 50)
            Button.center = view.center
        }
        @objc private func didTapButton(){
            guard let url = URL(string: "https://www.google.com") else {
                return
        }
            let vc = WebViewController(url: url, title: "google")
            let navVC = UINavigationController(rootViewController: vc)
            present(navVC, animated: true)

         }
    }
