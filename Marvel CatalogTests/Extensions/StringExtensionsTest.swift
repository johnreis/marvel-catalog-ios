//
//  StringExtensionsTest.swift
//  Marvel CatalogTests
//
//  Created by John Lenon Reis on 21/11/19.
//  Copyright © 2019 John Lenon Reis. All rights reserved.
//

import XCTest
@testable import Marvel_Catalog

class StringExtensionsTest: XCTestCase {

    func testShouldGenerateMD5() {
        let phrase = "Game of Thrones deserve a better ending"
        let expectedMD5 = "72f223831ae66b6277b9010c85d5fe70"
        XCTAssertEqual(phrase.md5(), expectedMD5)
    }
}
