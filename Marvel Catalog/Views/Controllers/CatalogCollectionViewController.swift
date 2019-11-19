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
        
        self.fetchCharacters(offset: 0)
    }
    
    func fetchCharacters(offset: Int) {
        self.view.showActivityIndicator(self.activityIndicator)
        self.activityIndicator.startAnimating()
        self.viewModel.fetchCharacters(offset: offset) {
            self.view.hideActivityIndicator(self.activityIndicator)
            self.collectionView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! CatalogDetailViewController
        let indexPath = self.collectionView.indexPathsForSelectedItems?.first
        viewController.viewModel = self.viewModel.detailViewModel(for: indexPath!)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! CatalogCollectionViewCell
        cell.viewModel = self.viewModel.cellViewModel(for: indexPath)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.viewModel.fetchIfNeeded(for: indexPath) {
            self.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.numberOfItems()
    }
    
}

extension CatalogCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width * 0.28, height: 160)
    }
    
}
