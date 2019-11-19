//
//  CatalogCellViewModel.swift
//  Marvel Catalog
//
//  Created by John Lenon Reis on 19/11/19.
//  Copyright © 2019 John Lenon Reis. All rights reserved.
//

import Foundation
import Alamofire

class CatalogCellViewModel {
    
    var service: MarvelService!
    var character: MarvelCharacter!
    
    var thumbnailURL: String {
        return self.character.thumbnail.urlPath(type: .portraitMedium)
    }
    
    init(service: MarvelService, character: MarvelCharacter) {
        self.service = service
        self.character = character
    }
}
