//
//  WebViewViewController.swift
//  Binar
//
//  Created by Muhammad dhani Bukhory on 21/05/22.
//


    import UIKit
    import WebKit

    class WebViewController: UIViewController {

        private let WebView: WKWebView = {
            
            let preferences = WKWebpagePreferences()
            if #available(iOS 14.0, *) {
                preferences.allowsContentJavaScript = true
            } else {
                // Fallback on earlier versions
            }
            let configuration = WKWebViewConfiguration()
            configuration.defaultWebpagePreferences = preferences
            let WebView = WKWebView(frame: .zero, configuration: configuration)
            return WebView
        }()
        private let url: URL
        init(url: URL , title: String) {
            self.url = url
          
            super.init(nibName: nil, bundle: nil)
            
            self.title = title
        }

        required init?(coder: NSCoder) {
            fatalError()
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.addSubview(WebView)
            WebView.load(URLRequest(url: url))
            
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            WebView.frame = view.bounds
        }

    }
