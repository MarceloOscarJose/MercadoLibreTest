//
//  UIImageView.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/5/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import UIKit

extension UIImageView {

    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.y")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.7
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0]
        layer.add(animation, forKey: "shake")
    }

    public func imageFromServerURL(urlString: String) {
        let url = URL(string: urlString)
        self.af_setImage(withURL: url!, imageTransition: .crossDissolve(0.3))
    }
}
