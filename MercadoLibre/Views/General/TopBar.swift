//
//  MLTopBar.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/5/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import UIKit

protocol TopBarDelegate: class {
    func leftButtonPressed()
}

class TopBar: BaseView {

    let titleLabel: UILabel = UILabel()
    let backButton: UIButton = UIButton()

    var delegate: TopBarDelegate?

    // MARK - Lifecycle
    convenience init(title: String){
        self.init()

        self.backgroundColor = UIColor.mercadoYellow
        self.createBackButton()
        self.createHeaderTitle(title: title)
    }

    // MARK - Private
    func createHeaderTitle(title: String){
        self.titleLabel.text = title
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        self.titleLabel.textColor = UIColor.black
        self.titleLabel.lineBreakMode = .byTruncatingTail
        self.addSubview(self.titleLabel)

        self.titleLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
        self.titleLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
        self.titleLabel.autoPinEdge(.leading, to: .trailing, of: self.backButton, withOffset: 20)
        self.titleLabel.autoMatch(.height, to: .height, of: self, withMultiplier: 0.5)
    }

    func createBackButton(){
        self.backButton.setBackgroundImage(UIImage(named: "Back"), for: UIControlState.normal)
        self.backButton.addTarget(self, action: #selector(TopBar.goBack), for: UIControlEvents.touchUpInside)
        self.backButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.addSubview(self.backButton)

        self.backButton.autoAlignAxis(toSuperviewAxis: .horizontal)
        self.backButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        self.backButton.autoMatch(.height, to: .height, of: self, withMultiplier: 0.5)
        self.backButton.autoMatch(.width, to: .height, of: self.backButton, withMultiplier: 1)
    }

    func goBack(){
        if let delegate = self.delegate {
            delegate.leftButtonPressed()
        }
    }
}
