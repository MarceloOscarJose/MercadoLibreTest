//
//  ProductDescription.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/7/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import UIKit

class ProductDescription: UIWebView {

    // MARK - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public convenience init(description: ItemDescription) {
        self.init()
        self.backgroundColor = UIColor.mavPaleGreyTwo
        self.createControls(description: description)
    }

    func createControls(description: ItemDescription) {
        self.scalesPageToFit = true

        if description.text == "" {
            let descriptionTitle = UILabel()
            descriptionTitle.text = "product_description_empty".localized
            descriptionTitle.font = UIFont.systemFont(ofSize: 24)
            descriptionTitle.textColor = UIColor.mavCharcoalGrey
            descriptionTitle.numberOfLines = 0
            descriptionTitle.lineBreakMode = .byWordWrapping

            self.addSubview(descriptionTitle)
            descriptionTitle.autoAlignAxis(toSuperviewAxis: .vertical)
            descriptionTitle.autoAlignAxis(toSuperviewAxis: .horizontal)
            descriptionTitle.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
            descriptionTitle.autoPinEdge(toSuperviewEdge: .right, withInset: 20)
        }

        self.loadHTMLString(description.text, baseURL: nil)
    }
}
