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
    
    var thumbnailURL: String {
        return self.character.thumbnail.urlPath(type: .portraitFantastic)
    }
    
    init(service: MarvelService, character: MarvelCharacter) {
        self.service = service
        self.character = character
    }
}
