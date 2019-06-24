//
//  ProductDetails.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/7/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import UIKit

class ProductDetails: UIView {

    var title: ProductTitle!
    var price: ProductPrice!
    var category: ProductCategory!
    var descriptionLink: ProductLink!

    // MARK - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public convenience init(item: Item, itemCurrency: Currency, installmentsCurrency: Currency, category: Category) {
        self.init()

        self.backgroundColor = UIColor.clear

        self.title = ProductTitle(title: item.title)
        self.price = ProductPrice(item: item, itemCurrency: itemCurrency, installmentsCurrency: installmentsCurrency)
        self.category = ProductCategory(category: category)
        self.descriptionLink = ProductLink()

        self.addSubview(self.title)
        self.addSubview(self.price)
        self.addSubview(self.category)
        self.addSubview(self.descriptionLink)

        self.createConstraints()
    }

    // MARK - Private
    func createConstraints() {
        
        self.title.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
        self.title.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
        self.title.autoPinEdge(toSuperviewEdge: .right, withInset: 20)
        self.title.autoMatch(.width, to: .width, of: self, withOffset: -40)

        self.price.autoPinEdge(.top, to: .bottom, of: self.title, withOffset: 10)
        self.price.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
        self.price.autoPinEdge(toSuperviewEdge: .right, withInset: 20)
        self.price.autoMatch(.width, to: .width, of: self, withOffset: -40)
        self.price.autoSetDimension(.height, toSize: 45.0)

        self.category.autoPinEdge(.top, to: .bottom, of: self.price, withOffset: 10)
        self.category.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
        self.category.autoPinEdge(toSuperviewEdge: .right, withInset: 20)
        self.category.autoMatch(.width, to: .width, of: self, withOffset: -40)

        self.descriptionLink.autoPinEdge(toSuperviewEdge: .bottom, withInset: -20)
        self.descriptionLink.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
        self.descriptionLink.autoPinEdge(toSuperviewEdge: .right, withInset: 20)
        self.descriptionLink.autoMatch(.width, to: .width, of: self, withOffset: -40)
        self.descriptionLink.autoSetDimension(.height, toSize: 40)
    }
}
