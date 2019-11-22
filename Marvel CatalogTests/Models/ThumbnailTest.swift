//
//  ThumbnailTest.swift
//  Marvel CatalogTests
//
//  Created by John Lenon Reis on 21/11/19.
//  Copyright © 2019 John Lenon Reis. All rights reserved.
//

import XCTest
@testable import Marvel_Catalog

class ThumbnailTest: XCTestCase {
    
    var thumbnail: Thumbnail!
    let path = "http://fakeimage.com/etc"
    let ext = "png"
    
    override func setUp() {
        self.thumbnail = Thumbnail(path: self.path, extension: self.ext)
    }
    
    func testShouldReturnUrlPath() {
        let type: ThumbnailType = .detail
        let urlPath = self.thumbnail.urlPath(type: type)
        let expectedPath = "\(self.path)/\(type.rawValue).\(self.ext)"
        XCTAssertEqual(urlPath, expectedPath)
    }
}
