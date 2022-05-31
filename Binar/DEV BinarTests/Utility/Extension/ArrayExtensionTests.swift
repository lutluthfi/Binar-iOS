//
//  ArrayExtensionTests.swift
//  DEV BinarTests
//
//  Created by Arif Luthfiansyah on 31/05/22.
//

@testable import DEV_Binar
import XCTest

final class ArrayExtensionTests: XCTestCase {
    func test_isNotEmpty_whenArrayHold10Elements_thenResultTrue() {
        let array: [Int] = Array(1...10)
        let res: Bool = array.isNotEmpty
        XCTAssertTrue(res)
    }
    
    func test_isNotEmpty_whenArrayHold0Element_thenResultFalse() {
        let array: [Int] = []
        let res: Bool = array.isNotEmpty
        XCTAssertFalse(res)
    }
}
