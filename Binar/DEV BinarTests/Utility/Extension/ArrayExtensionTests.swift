//
//  ArrayExtensionTests.swift
//  DEV BinarTests
//
//  Created by Arif Luthfiansyah on 31/05/22.
//

@testable import DEV_Binar
import XCTest

final class ArrayExtensionTests: XCTestCase {
    func test_subscriptSafeClosureGetter_whenIndexInRange_thenElementNotNil() {
        let range: Int = 2
        
        let array: [Int] = Array(1...10)
        let res = array[safe: range]
        XCTAssertNotNil(res)
    }
    
    func test_subscriptSafeClosureGetter_whenIndexOutRange_thenElementNil() {
        let range: Int = 20
        
        let array: [Int] = Array(1...10)
        let res = array[safe: range]
        XCTAssertNil(res)
    }
    
    func test_subscriptSafeClosureSetter_whenIndexInRange_thenElementEqualToNewValue() {
        let expValue: Int = 10
        
        let range: Int = 2
        
        var array: [Int] = Array(1...10)
        array[safe: range] = expValue
        
        let res = array[safe: range]
        XCTAssertEqual(res, expValue)
    }
    
    func test_subscriptSafeClosureSetter_whenIndexOutRange_thenElementNil() {
        let expValue: Int = 3

        let range: Int = 20

        var array: [Int] = Array(1...10)
        array[safe: range] = expValue

        let res = array[safe: range]
        XCTAssertNil(res)
    }
    
    func test_isNotEmpty_whenArrayHold10Elements_thenResultTrue() {
        let array: [Int] = Array(1...10)
        let res = array.isNotEmpty
        XCTAssertTrue(res)
    }
    
    func test_isNotEmpty_whenArrayHold0Element_thenResultFalse() {
        let array: [Int] = []
        let res = array.isNotEmpty
        XCTAssertFalse(res)
    }
}
