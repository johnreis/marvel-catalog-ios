//
//  CatalogCollectionViewCell.swift
//  Marvel Catalog
//
//  Created by John Lenon Reis on 15/11/19.
//  Copyright © 2019 John Lenon Reis. All rights reserved.
//

import UIKit

class CatalogCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewCharacter: UIImageView!
    
    var viewModel: CatalogCellViewModel! {
        didSet {
            self.imageViewCharacter.download(from: self.viewModel.thumbnailURL)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.imageViewCharacter.image = nil
    }
}
