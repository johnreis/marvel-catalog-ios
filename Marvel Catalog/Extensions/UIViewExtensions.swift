//
//  UIViewControllerExtensions.swift
//  Marvel Catalog
//
//  Created by John Lenon Reis on 09/11/19.
//  Copyright © 2019 John Lenon Reis. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func showActivityIndicator(_ activityIndicator: UIActivityIndicatorView) {
        activityIndicator.startAnimating()
        activityIndicator.center = self.center
        activityIndicator.color = .white
        self.addSubview(activityIndicator)
    }
    
    func hideActivityIndicator(_ activityIndicator: UIActivityIndicatorView) {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
    
}
