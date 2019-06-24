//
//  ProductPrice.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/6/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import UIKit

class ProductPrice: UIView {

    let price: UILabel = {
        let label = UILabel.newAutoLayout()
        label.textColor = UIColor.mavPeacockBlue
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.3
        label.font = UIFont.systemFont(ofSize: 24)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping

        return label
    }()
    let installments: UILabel = {
        let label = UILabel.newAutoLayout()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.contentMode = .scaleAspectFit
        label.textColor = UIColor.black
        return label
    }()

    public convenience init(item: Item, itemCurrency: Currency, installmentsCurrency: Currency) {
        self.init()

        let itemFormatter = NumberFormatter()
        itemFormatter.currencyCode = itemCurrency.id
        itemFormatter.currencySymbol = itemCurrency.symbol
        itemFormatter.maximumFractionDigits = itemCurrency.decimal_places
        itemFormatter.numberStyle = .currency

        let installmentsFormatter = NumberFormatter()
        installmentsFormatter.currencyCode = installmentsCurrency.id
        installmentsFormatter.currencySymbol = installmentsCurrency.symbol
        installmentsFormatter.maximumFractionDigits = installmentsCurrency.decimal_places
        installmentsFormatter.numberStyle = .currency

        if let finalPrice = itemFormatter.string(from: NSNumber(value: item.price)) {
            price.text = finalPrice
        }
        if item.installments.amount != 0, let finalinstallment = installmentsFormatter.string(from: NSNumber(value: (item.installments.amount))) {
            installments.text = "\(item.installments.quantity)x \(finalinstallment)"
        }
        
        self.createControls()
        self.updateLayout()
    }

    func createControls() {
        self.addSubview(self.price)
        self.addSubview(self.installments)
    }
    
    func updateLayout() {
        
        self.price.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
        self.price.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
        self.price.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
        self.price.autoMatch(.width, to: .width, of: self)

        self.installments.autoPinEdge(.top, to: .bottom, of: self.price, withOffset: 0)
        self.installments.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
        self.installments.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
        self.installments.autoMatch(.width, to: .width, of: self, withOffset: 0)
    }
}
