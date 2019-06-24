//
//  ProductLink.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/8/17.
//  Copyright © 2017 Marcelo Oscar José. All rights reserved.
//

import UIKit

class ProductLink: UIButton {

    // MARK - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitle("product_description_button".localized, for: UIControlState.normal)
        self.setTitleColor(UIColor.mavBlueyGrey, for: UIControlState.normal)
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        self.setBackgroundImage(UIImage(color: UIColor.mavPeacockBlue), for: UIControlState.normal)
        self.setBackgroundImage(UIImage(color: UIColor.mavPaleGrey), for: UIControlState.selected)
        self.setBackgroundImage(UIImage(color: UIColor.mavPaleGrey), for: UIControlState.focused)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
