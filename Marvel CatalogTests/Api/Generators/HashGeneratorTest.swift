//
//  HashGeneratorTest.swift
//  Marvel CatalogTests
//
//  Created by John Lenon Reis on 15/11/19.
//  Copyright © 2019 John Lenon Reis. All rights reserved.
//

import XCTest
@testable import Marvel_Catalog

class HashGeneratorTest: XCTestCase {
    
    let publicKey = "fake_public_key"
    let privateKey = "fake_private_key"
    let ts = "1573178292224.2952"
    
    func testShouldGenerateHash() {
        let hash = HashGenerator.hash(ts: ts, privateKey: privateKey, publicKey: publicKey)
        XCTAssertEqual(hash, "7c9baf7077f704a30ecee0b52623de0d")
    }
    
    
}

