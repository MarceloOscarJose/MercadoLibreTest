//
//  BaseView.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/7/17.
//  Copyright © 2017 Marcelo Oscar José. All rights reserved.
//

import UIKit

class BaseView: UIView {

    // MARK - Lifecycle
    override init(frame: CGRect){
        super.init(frame: frame)

        self.createControls()
        self.updateLayout()
    }

    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }

    func createControls() {
    }

    func updateLayout() {
    }
}
