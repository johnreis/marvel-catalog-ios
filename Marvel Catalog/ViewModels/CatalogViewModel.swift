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
    
    static let limit: Int = 100
    
    private var data: MarvelData!
    
    private var characters: [MarvelCharacter] = []
    
    private var service: MarvelService!
    
    init(service: MarvelService) {
        self.service = service
    }
    
    func numberOfItems() -> Int {
        return self.characters.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> CatalogCellViewModel {
        return CatalogCellViewModel(service: self.service, character: self.characters[indexPath.row])
    }
    
    func detailViewModel(for indexPath: IndexPath) -> CatalogDetailViewModel {
        return CatalogDetailViewModel(service: self.service, character: self.characters[indexPath.row])
    }
    
    func fetchIfNeeded(for indexPath: IndexPath, name: String? = nil, completionHandler: @escaping () -> Void) {
        if self.data.hasMore() && indexPath.row == self.numberOfItems() - 1 {
            self.fetchCharacters(offset: CatalogViewModel.limit, name: name, completionHandler: completionHandler)
        }
    }
    
    func fetchCharacters(offset: Int, name: String? = nil, completionHandler: @escaping () -> Void)  {
        if offset == 0 {
            self.characters = []
        }
        
        self.service.characters(offset: offset, name: name) { (result) in

            if let value = result.value {
                self.data = value.data
                self.characters += value.data.results.filter({ (character) -> Bool in
                    return !character.thumbnail.path.contains("image_not_available")
                })
            }
            
            completionHandler()
        }
    }
    
    func fetchCharactersByName(name: String, completionHandler: @escaping () -> Void) {
        self.characters = []
        self.fetchCharacters(offset: 0, name: name, completionHandler: completionHandler)
    }
}
