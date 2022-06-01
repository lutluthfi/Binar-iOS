//
//  ARSignInViewControllerTests.swift
//  DEV BinarTests
//
//  Created by Arif Luthfiansyah on 31/05/22.
//

@testable import DEV_Binar
import XCTest

final class ARSignInViewControllerTests: XCTestCase {
    func test_viewDidLoad_shouldBackgroundColorWhite() {
        let expValue = UIColor.white
        
        let viewController = ARSignInViewController()
        viewController.viewDidLoad()
        
        let res = viewController.view.backgroundColor
        XCTAssertEqual(res, expValue)
    }
    
    func test_viewDidLoad_shouldTitleSignIn() {
        let expValue = "Sign In"
        
        let viewController = ARSignInViewController()
        viewController.viewDidLoad()
        
        let res = viewController.navigationItem.title
        XCTAssertEqual(res, expValue)
    }
    
    func test_viewDidLoad_shouldLeftBarButtonItemNotNil() {
        let viewController = ARSignInViewController()
        viewController.viewDidLoad()
        
        let res = viewController.navigationItem.leftBarButtonItem != nil
        XCTAssertTrue(res)
    }
    
    func test_viewDidLoad_shouldLeftBarButtonItemTitleEqualSignIn() {
        let expValue = "Sign In"
        
        let viewController = ARSignInViewController()
        viewController.viewDidLoad()
        
        let res = viewController.navigationItem.leftBarButtonItem?.title
        XCTAssertEqual(res, expValue)
    }
}
