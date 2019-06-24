//
//  SitesTableViewCell.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/6/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import UIKit

class SitesTableViewCell: UITableViewCell {

    let title: UILabel = {
        let label = UILabel.newAutoLayout()
        label.font = UIFont.systemFont(ofSize: 18)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = UIColor.mavCharcoalGrey
        return label
    }()

    var didSetupConstraints = false

    convenience init(site: Site) {
        self.init()

        title.text = "\(site.name) - \(site.id)"
        self.addSubview(title)
    }

    override func updateConstraints() {

        if (!didSetupConstraints) {
            title.autoAlignAxis(toSuperviewAxis: .horizontal)
            title.autoPinEdge(toSuperviewEdge: .leading, withInset: 10)
            didSetupConstraints = true
        }

        super.updateConstraints()
    }
}
