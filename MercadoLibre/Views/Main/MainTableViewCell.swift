//
//  SearchTableViewCell.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/5/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    let title: UILabel = {
        let label = UILabel.newAutoLayout()
        label.font = UIFont.systemFont(ofSize: 16)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.3
        label.textColor = UIColor.mavCharcoalGrey
        return label
    }()
    let installments: UILabel = {
        let label = UILabel.newAutoLayout()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.contentMode = .scaleAspectFit
        label.textColor = UIColor.mavBlueyGrey
        return label
    }()
    let price: UILabel = {
        let label = UILabel.newAutoLayout()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.mavPeacockBlue
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.3
        return label
    }()
    let thumbnail: UIImageView = {
        let image = UIImageView.newAutoLayout()
        image.backgroundColor = UIColor.clear
        image.tintColor = UIColor.clear
        image.contentMode = .scaleAspectFill
        return image
    }()

    var didSetupConstraints = false

    convenience init(item: Item, itemCurrency: Currency, installmentsCurrency: Currency) {
        self.init()
        
        title.text = item.title

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

        // Image
        thumbnail.image = UIImage(named: "Placeholder")
        if item.thumbnail != "" {
            thumbnail.imageFromServerURL(urlString: item.thumbnail)
        }

        self.addSubview(thumbnail)
        self.addSubview(price)
        self.addSubview(installments)
        self.addSubview(title)
    }

    override func updateConstraints() {

        if (!didSetupConstraints) {

            thumbnail.autoPinEdge(toSuperviewEdge: .leading, withInset: 10)
            thumbnail.autoMatch(.width, to: .width, of: self, withMultiplier: 0.4)
            thumbnail.autoMatch(.height, to: .height, of: thumbnail)
            thumbnail.autoAlignAxis(toSuperviewAxis: .horizontal)

            price.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
            price.autoPinEdge(.left, to: .right, of: thumbnail, withOffset: 20)
            price.autoSetDimension(.height, toSize: 30)
            price.autoPinEdge(toSuperviewEdge: .trailing, withInset: 10)

            installments.autoPinEdge(.top, to: .bottom, of: price, withOffset: 0)
            installments.autoPinEdge(.left, to: .right, of: thumbnail, withOffset: 20)

            title.autoPinEdge(.top, to: .bottom, of: installments, withOffset: 10)
            title.autoPinEdge(.left, to: .right, of: thumbnail, withOffset: 20)
            title.autoPinEdge(toSuperviewEdge: .trailing, withInset: 10)

            didSetupConstraints = true
        }

        super.updateConstraints()
    }
}
