//
//  MarvelService.swift
//  Marvel Catalog
//
//  Created by John Lenon Reis on 07/11/19.
//  Copyright © 2019 John Lenon Reis. All rights reserved.
//

import Foundation
import Alamofire


class MarvelService {
    
    var config: ApiConfiguration!
    
    init(config: ApiConfiguration) {
        self.config = config
    }
    
    func characters(offset: Int, name: String? = nil, completionHandler: @escaping (AFDataResponse<MarvelCharactersResult>) -> Void) {
        let params = config.params().offset(offset)
        
        if let name = name {
            if !name.isEmpty {
                params.name(name)
            }
        }
        
        AF.request(config.url(with: "characters"), parameters: params.build(), encoding: URLEncoding.queryString)
            .responseDecodable(of: MarvelCharactersResult.self, completionHandler: completionHandler)
    }
}

