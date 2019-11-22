//
//  UIImageExtensionsTest.swift
//  Marvel CatalogTests
//
//  Created by John Lenon Reis on 21/11/19.
//  Copyright © 2019 John Lenon Reis. All rights reserved.
//

import XCTest
@testable import Marvel_Catalog

class UIImageExtensionsTest: XCTestCase {
    
    let size = CGSize(width: 10, height: 10)
    let color = UIColor.orange
    let expectedColor = UIColor.init(red: 1, green: 0.50196078431372548, blue: 0, alpha: 1)
    
    func testShouldReturnAverageColor() {
        let image = UIGraphicsImageRenderer(size: self.size).image { rendererContext in
            self.color.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: self.size))
        }
        
        let averageColor = image.averageColor
        
        XCTAssertEqual(self.expectedColor, averageColor)
    }
}
