//
//  CatalogCollectionViewController.swift
//  Marvel Catalog
//
//  Created by John Lenon Reis on 14/11/19.
//  Copyright © 2019 John Lenon Reis. All rights reserved.
//

import UIKit

class CatalogCollectionViewController: UICollectionViewController {

    private var viewModel: CatalogViewModel!
    private let cellIdentifier = "CatalogCell"
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = CatalogViewModel(
            service: MarvelService(
                config: ApiConfiguration.shared
            )
        )
        
        self.fetchCharacters()
    }
    
    func fetchCharacters() {
        self.view.showActivityIndicator(self.activityIndicator)
        self.activityIndicator.startAnimating()
        self.viewModel.characters {
            self.view.hideActivityIndicator(self.activityIndicator)
            self.collectionView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! CatalogDetailViewController
        let index = self.collectionView.indexPathsForSelectedItems?.first?.row
        let character = self.viewModel.characters[index!]
        viewController.viewModel = CatalogDetailViewModel(service: viewModel.service,character: character)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! CatalogCollectionViewCell
        
        let character = self.viewModel.characters[indexPath.row]
        
        self.viewModel.setup(with: character, completionHandler: { response in
            if let data = response.data {
                cell.imageViewCharacter.image = UIImage(data: data)
            }
        })
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.characters.count
    }
    
}

extension CatalogCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.size.width
        return CGSize(width: width * 0.28, height: 160)
    }
    
}
