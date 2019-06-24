//
//  ProductPrice.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/7/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import UIKit

class ProductTitle: UILabel {

    // MARK - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public convenience init(title: String) {
        self.init()

        self.text = title
        self.font = UIFont.systemFont(ofSize: 23)
        self.textColor = UIColor.mavCharcoalGrey
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
    }
}
