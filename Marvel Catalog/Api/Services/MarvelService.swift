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
    
    func characters(completionHandler: @escaping (AFDataResponse<MarvelCharactersResult>) -> Void) {
        AF.request(config.url(with: "characters"), parameters: config.params(), encoding: URLEncoding.queryString)
            .responseDecodable(of: MarvelCharactersResult.self, completionHandler: completionHandler)
    }
    
    func thumbnail(thumbnailUrl: String, completionHandler: @escaping (AFDataResponse<Data>) -> Void) {
        AF.request(thumbnailUrl)
        .responseData(completionHandler: completionHandler)
    }
}
