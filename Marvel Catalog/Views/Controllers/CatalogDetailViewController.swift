//
//  CatalogDetailViewController.swift
//  Marvel Catalog
//
//  Created by John Lenon Reis on 16/11/19.
//  Copyright © 2019 John Lenon Reis. All rights reserved.
//

import UIKit

class CatalogDetailViewController: UIViewController {

    var viewModel: CatalogDetailViewModel!
    var activityIndicator = UIActivityIndicatorView(style: .large)
    
    @IBOutlet weak var imageViewThumbnail: UIImageView!
    @IBOutlet weak var labelCharacterName: UILabel!
    @IBOutlet weak var labelCharacterDescription: UILabel!
    @IBOutlet weak var constraintStackButtonsHeight: NSLayoutConstraint!
    
    @IBOutlet weak var buttonDetail: UIButton!
    @IBOutlet weak var buttonWiki: UIButton!
    @IBOutlet weak var buttonComics: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    private func hideButtons() {
        self.buttonDetail.isHidden = true
        self.buttonWiki.isHidden = true
        self.buttonComics.isHidden = true

        self.constraintStackButtonsHeight.constant = 0
        view.layoutIfNeeded()
    }
    
    private func showButtons() {
        if self.viewModel.character.getLink(to: .detail) != nil {
            self.buttonDetail.isHidden = false
        }
        
        if self.viewModel.character.getLink(to: .wiki) != nil {
            self.buttonWiki.isHidden = false
        }
        
        if self.viewModel.character.getLink(to: .comiclink) != nil {
            self.buttonComics.isHidden = false
        }
        
        self.view.layoutIfNeeded()
    
        UIView.animate(withDuration: 0.7) {
            self.constraintStackButtonsHeight.constant = 50
            self.view.layoutIfNeeded()
        }
    }
    
    private func changeButtonsBackgroundColor(to color: UIColor?) {
        self.buttonDetail.backgroundColor = color
        self.buttonWiki.backgroundColor = color
        self.buttonComics.backgroundColor = color
    }
    
    private func setupThumbnail() {
        self.imageViewThumbnail.download(from: self.viewModel.thumbnailURL) { (data) in
            self.changeButtonsBackgroundColor(to: data?.averageColor)
            self.view.hideActivityIndicator(self.activityIndicator)
            self.showButtons()
        }
    }
    
    func setupUI() {
        self.title = self.viewModel.character.name
        self.hideButtons()
        self.view.showActivityIndicator(self.activityIndicator)
        self.setupThumbnail()
        self.labelCharacterName.text = "\(self.viewModel.character.name) ·"
        self.labelCharacterDescription.text = self.viewModel.character.description.isEmpty ? "No description available." : self.viewModel.character.description
    }
    
    @IBAction func openLink(_ sender: UIButton) {
        var link: String? = ""
        
        switch sender {
            case self.buttonDetail:
                link = self.viewModel.character.getLink(to: .detail)?.url
                break
            case self.buttonWiki:
                link = self.viewModel.character.getLink(to: .wiki)?.url
                break
            default:
                link = self.viewModel.character.getLink(to: .comiclink)?.url
                break
        }
        
        guard let url = link else { return }
        
        if let url = URL(string: url) {
            UIApplication.shared.open(url)
        }
    }
}
