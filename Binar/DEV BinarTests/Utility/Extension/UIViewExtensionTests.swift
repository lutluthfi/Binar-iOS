//
//  UIViewExtensionTests.swift
//  DEV BinarTests
//
//  Created by Arif Luthfiansyah on 31/05/22.
//

@testable import DEV_Binar
import XCTest

final class UIViewExtensionTests: XCTestCase {
    func test_rounded_shouldCornerRadius16() {
        let expValue: CGFloat = 16
        
        let view = UIView()
        view.rounded(cornerRadius: expValue)
        
        let res = view.layer.cornerRadius
        XCTAssertEqual(res, expValue)
    }
    
    func test_rounded_whenDefaultBorderWidth_thenBorderWidthZero() {
        let expValue: CGFloat = 0
        
        let view = UIView()
        view.rounded(cornerRadius: 16)
        
        let res = view.layer.borderWidth
        XCTAssertEqual(res, expValue)
    }
    
    func test_rounded_whenNotDefaultBorderWidth_thenBorderWidthNotZero() {
        let expValue: CGFloat = 2
        
        let view = UIView()
        view.rounded(cornerRadius: 16, borderWidth: expValue)
        
        let res = view.layer.borderWidth
        XCTAssertEqual(res, expValue)
    }
}
