//
//  ProductView.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/6/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import UIKit

class ProductView: UIView {

    var slideshow: ProductSlider!
    var details: ProductDetails!

    // MARK - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public convenience init(item: Item, itemCurrency: Currency, installmentsCurrency: Currency, category: Category) {
        self.init()

        self.backgroundColor = UIColor.mavPaleGreyTwo

        self.slideshow = ProductSlider(itemPictures: item.pictures)
        self.details = ProductDetails(item: item, itemCurrency: itemCurrency, installmentsCurrency: installmentsCurrency, category: category)

        self.addSubview(self.slideshow)
        self.addSubview(self.details)

        self.updateContrains()
    }

    // MARK - Private
    func updateContrains() {

        self.slideshow.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
        self.slideshow.autoPinEdge(.right, to: .right, of: self, withOffset: 0)
        self.slideshow.autoPinEdge(.left, to: .left, of: self, withOffset: 0)
        self.slideshow.autoMatch(.height, to: .height, of: self, withMultiplier: 0.3)

        self.details.autoPinEdge(.top, to: .bottom, of: self.slideshow, withOffset: 20)
        self.details.autoPinEdge(.right, to: .right, of: self, withOffset: 0)
        self.details.autoPinEdge(.left, to: .left, of: self, withOffset: 0)
        self.details.autoMatch(.height, to: .height, of: self, withMultiplier: 0.6)
    }
}
