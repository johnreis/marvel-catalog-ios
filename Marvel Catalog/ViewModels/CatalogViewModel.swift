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
    
    
    func fetchIfNeeded(for indexPath: IndexPath, completionHandler: @escaping () -> Void) {
        if indexPath.row == self.numberOfItems() - 1 {
            self.fetchCharacters(offset: self.numberOfItems(), completionHandler: completionHandler)
        }
    }
    
    func fetchCharacters(offset: Int, completionHandler: @escaping () -> Void)  {
        self.service.characters(offset: offset) { (result) in

            if let value = result.value {
                self.characters += value.data.results.filter({ (character) -> Bool in
                    return !character.thumbnail.path.contains("image_not_available")
                })
            }
            
            completionHandler()
        }
    }
}
