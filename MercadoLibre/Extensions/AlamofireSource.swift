//
//  AlamofireSource.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/4/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import Alamofire
import AlamofireImage
import ImageSlideshow

/// Input Source to image using Alamofire
public class AlamofireSource: NSObject, InputSource {
    var url: URL

    /// Initializes a new source with a URL
    /// - parameter url: a url to be loaded
    public init(url: URL) {
        self.url = url
        super.init()
    }

    /// Initializes a new source with a URL string
    /// - parameter urlString: a string url to be loaded
    public init?(urlString: String) {
        if let validUrl = URL(string: urlString) {
            self.url = validUrl
            super.init()
        } else {
            return nil
        }
    }

    public func load(to imageView: UIImageView, with callback: @escaping (UIImage) -> ()) {
        imageView.af_setImage(withURL: self.url, placeholderImage: UIImage(named: "Placeholder"), filter: nil, progress: nil) { (response) in
            imageView.image = response.result.value
            if let value = response.result.value {
                callback(value)
            }
        }
    }
}
