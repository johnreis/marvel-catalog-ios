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
    
    private var service: MarvelService!
    private var character: MarvelCharacter!

    var thumbnailURL: String {
        return self.character.thumbnail.urlPath(type: .portraitFantastic)
    }
    
    func characterName() -> String {
        return self.character.name
    }
    
    func characterDescription() -> String {
        return self.character.description
    }
    
    func getLink(to type: MarvelUrlType) -> MarvelUrl? {
        return self.character.getLink(to: type)
    }
    
    init(service: MarvelService, character: MarvelCharacter) {
        self.service = service
        self.character = character
    }
}
