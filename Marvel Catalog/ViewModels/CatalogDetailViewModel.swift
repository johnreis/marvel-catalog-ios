//
//  CatalogDetailViewModel.swift
//  Marvel Catalog
//
//  Created by John Lenon Reis on 16/11/19.
//  Copyright © 2019 John Lenon Reis. All rights reserved.
//

import Foundation
import Alamofire

class CatalogDetailViewModel {
    
    var service: MarvelService!
    var character: MarvelCharacter!
    var urls: [MarvelUrl] = []
    
    init(service: MarvelService, character: MarvelCharacter) {
        self.service = service
        self.character = character
    }
    
    func thumbnail(completionHandler: @escaping (AFDataResponse<Data>)-> Void) {
        return self.service.thumbnail(thumbnailUrl: character.thumbnail.urlPath(type: .portraitFantastic), completionHandler: completionHandler)
    }
    
    
    
}
