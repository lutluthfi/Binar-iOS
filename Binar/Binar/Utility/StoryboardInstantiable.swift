//
//  UIStoryboard+Extension.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 21/03/22.
//

import UIKit

protocol StoryboardInstantiable: NSObjectProtocol {
    associatedtype T
    static var defaultFileName: String { get }
    static func initViewController() -> T?
    static func initViewController(from storyboardName: String) -> T?
}

extension StoryboardInstantiable where Self: UIViewController {
    static var defaultFileName: String {
        return NSStringFromClass(Self.self).components(separatedBy: ".").last!
    }
    
    static func initViewController() -> Self? {
        let fileName: String = defaultFileName
        let storyboard = UIStoryboard(name: fileName, bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: fileName) as? Self else {
            fatalError("Cannot instantiate initial view controller \(Self.self) from storyboard with name \(fileName)")
        }
        return vc
    }
    
    static func initViewController(from storyboardName: String) -> Self? {
        let fileName: String = defaultFileName
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: fileName) as? Self else {
            fatalError("Cannot instantiate initial view controller \(Self.self) from storyboard with name \(storyboardName)")
        }
        return vc
    }
}
