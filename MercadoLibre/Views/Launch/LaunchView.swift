//
//  LaunchView.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/8/17.
//  Copyright © 2017 Marcelo Oscar José. All rights reserved.
//

import UIKit

class LaunchView: BaseView {

    let title: UILabel = {
        let label = UILabel.newAutoLayout()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        label.textColor = UIColor.mavPeacockBlue
        label.text = "app_name".localized
        return label
    }()
    let logo: UIImageView = {
        let image = UIImageView.newAutoLayout()
        image.image = UIImage(named: "Logo")
        return image
    }()
    let footer: UILabel = {
        let label = UILabel.newAutoLayout()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        label.textColor = UIColor.mavCharcoalGrey
        label.text = "app_copyright".localized
        return label
    }()

    override func createControls() {
        self.backgroundColor = UIColor.mercadoYellow

        self.addSubview(self.logo)
        self.addSubview(self.title)
        self.addSubview(self.footer)
    }

    override func updateLayout() {
        self.logo.autoAlignAxis(toSuperviewAxis: .horizontal)
        self.logo.autoAlignAxis(toSuperviewAxis: .vertical)
        self.logo.autoMatch(.width, to: .width, of: self, withMultiplier: 0.5)
        self.logo.autoMatch(.height, to: .width, of: self.logo, withMultiplier: 1)

        self.title.autoPinEdge(toSuperviewEdge: .top, withInset: 50)
        self.title.autoAlignAxis(toSuperviewAxis: .vertical)
        self.title.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
        self.title.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)

        self.footer.autoPinEdge(toSuperviewEdge: .bottom, withInset: 20)
        self.footer.autoAlignAxis(toSuperviewAxis: .vertical)
        self.footer.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
        self.footer.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
    }
}
