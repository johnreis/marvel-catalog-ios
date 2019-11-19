//
//  HashGenerator.swift
//  Marvel Catalog
//
//  Created by John Lenon Reis on 07/11/19.
//  Copyright © 2019 John Lenon Reis. All rights reserved.
//

import Foundation

struct HashGenerator {
    
    static func hash(ts: String, privateKey: String, publicKey: String) -> String {
        return "\(ts)\(privateKey)\(publicKey)".md5()
    }
    
}
