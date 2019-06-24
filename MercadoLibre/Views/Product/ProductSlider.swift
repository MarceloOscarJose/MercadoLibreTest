//
//  ProductSlider.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/7/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import UIKit
import ImageSlideshow

class ProductSlider: ImageSlideshow {

    //var slideshowTransitioningDelegate: ZoomAnimatedTransitioningDelegate?

    // MARK - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public convenience init(itemPictures: [ItemPicture]) {
        self.init()
        self.createControls(itemPictures: itemPictures)
    }
    
    // MARK - Private
    func createControls(itemPictures: [ItemPicture]) {

        var pictures: [AlamofireSource] = []

        for picture in itemPictures {
            pictures.append(AlamofireSource(urlString: picture.url)!)
        }

        self.pageControlPosition = PageControlPosition.underScrollView
        self.pageControl.currentPageIndicatorTintColor = UIColor.lightGray;
        self.pageControl.pageIndicatorTintColor = UIColor.black;
        self.contentScaleMode = UIViewContentMode.scaleAspectFill
        self.setImageInputs(pictures)
    }
}
