//
//  CatalogViewModel.swift
//  Marvel Catalog
//
//  Created by John Lenon Reis on 15/11/19.
//  Copyright © 2019 John Lenon Reis. All rights reserved.
//

import Foundation
import Alamofire

class CatalogViewModel {
    
    var characters: [MarvelCharacter] = []
    var refreshing: Bool = false
    var fetchedCharacters: Int = 0
    
    var service: MarvelService!
    
    init(service: MarvelService) {
        self.service = service
    }
    
    func characters(completionHandler: @escaping () -> Void)  {
        self.refreshing = true
        self.service.characters { (result) in

            if let value = result.value {
                
                self.fetchedCharacters = value.data.count
                self.characters += value.data.results.filter({ (character) -> Bool in
                    return !character.thumbnail.path.contains("image_not_available")
                })
                
            }
            
            self.refreshing = false
            completionHandler()
        }
    }
    
    func setup(with character: MarvelCharacter, completionHandler: @escaping (AFDataResponse<Data>) -> Void) {
        self.service.thumbnail(thumbnailUrl: character.thumbnail.urlPath(type: .portraitMedium), completionHandler: completionHandler)
    }
}
