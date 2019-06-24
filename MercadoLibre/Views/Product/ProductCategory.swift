//
//  ProductCategory.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/3/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import UIKit

class ProductCategory: UILabel {

    // MARK - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public convenience init(category: Category) {
        self.init()

        var pathText: [String] = []

        for path in category.path_from_root {
            pathText.append(path.name)
        }

        self.text = "category_label_text".localized + " " + pathText.joined(separator: " / ")
        self.font = UIFont.systemFont(ofSize: 18)
        self.textColor = UIColor.mavPeaGreen
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
    }
}
