//
//  DEV_BinarTestsAgain.swift
//  DEV BinarTests
//
//  Created by Bagas Ilham on 01/06/22.
//

import XCTest
@testable import DEV_Binar

final class BIAnimalViewControllerTests: XCTestCase {
    private var userDefaults: UserDefaults!
    
    override func setUp() {
        super.setUp()
        userDefaults = UserDefaults(suiteName: #file)
        userDefaults.removePersistentDomain(forName: #file)
    }
    
    override func tearDown() {
        super.tearDown()
        userDefaults.removeSuite(named: #file)
    }
    
//    func test_shouldCountAnimalNotNil() throws {
//        let BIAnimal = BIAnimalViewController()
//        var res = BIAnimal.displayedAnimal?.count
//            
//            XCTAssertNotNil(res)
//    }
//        
//        func test_shouldTitleAppear() throws {
//            let BIAnimal = BIAnimalViewController()
//            var res = BIAnimal.title
//            let title = "Animal List"
//            XCTAssertEqual(res, title)
//    }
//        
//        func test_shouldCountAnimalDecreased() throws {
//            let BIAnimal = BIAnimalViewController()
//            var res = BIAnimal.displayedAnimal?.count
//            let count = 98
//            XCTAssertLessThan(res, count)
//    }
    
    func test_tableViewNumberOfRowInSection_whenAnySection_thenNumberOfRowEqualNumberOfDisplayedAnimal() {
        let expValue = 100
        
        let section = Int.random(in: 1...10)
        let viewController = BIAnimalViewController(userDefaults: userDefaults)
        let tableView = viewController.tableView
        
        guard let _tableView = tableView else {
            XCTExpectFailure("UITableView is nil")
            return
        }
        viewController.viewDidLoad()
        
        let res = viewController.tableView(_tableView, numberOfRowsInSection: section)
        XCTAssertEqual(res, expValue)
    }
    
    func test_viewDidLoad_shouldRightBarButtonItemNotNil() {
        let viewController = BIAnimalViewController(userDefaults: userDefaults)
        viewController.viewDidLoad()
        let res = viewController.navigationItem.rightBarButtonItem
        XCTAssertNotNil(res)
    }
}
