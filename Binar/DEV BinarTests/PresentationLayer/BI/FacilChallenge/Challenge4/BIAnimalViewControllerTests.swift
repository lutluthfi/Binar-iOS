//
//  DEV_BinarTestsAgain.swift
//  DEV BinarTests
//
//  Created by Bagas Ilham on 01/06/22.
//

import XCTest
@testable import DEV_Binar

final class BIAnimalViewControllerTests: XCTestCase {
    
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
        let expValue = BIAnimalViewController().displayedAnimal
        let section = Int.random(in: 1...10)
        let viewController = BIAnimalViewController()
        let tableView = viewController.tableView
        guard let _tableView = tableView else {
            XCTExpectFailure("tableView is nil")
            return
        }
        viewController.viewDidLoad()
        let res = viewController.tableView(_tableView, numberOfRowsInSection: section)
        XCTAssertEqual(res, expValue)
    }
    
    func test_viewDidLoad_shouldRightBarButtonItemNotNil() {
        let viewController = BIAnimalViewController()
        viewController.viewDidLoad()
        let res = viewController.navigationItem.rightBarButtonItem
        XCTAssertNotNil(res)
    }

}
