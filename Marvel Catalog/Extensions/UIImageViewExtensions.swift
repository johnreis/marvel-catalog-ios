//
//  UIImageViewExtensions.swift
//  Marvel Catalog
//
//  Created by John Lenon Reis on 19/11/19.
//  Copyright © 2019 John Lenon Reis. All rights reserved.
//

import Foundation
import Alamofire

extension UIImageView {
    func download(from url: String, completionHandler: ((UIImage?) -> Void)? = nil) {
        AF.request(url).responseData { (response) in
            guard let data = response.data else { return }
            self.image = UIImage(data: data)
            
            if let handler = completionHandler {
                handler(self.image)
            }
        }
    }
}
