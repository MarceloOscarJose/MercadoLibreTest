//
//  ProductDescriptionViewController.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/8/17.
//  Copyright © 2017 Marcelo Oscar José. All rights reserved.
//

import UIKit

class DescriptionViewController: BaseViewController, UIWebViewDelegate {

    var productDescription = ProductDescription()

    convenience init(item: Item) {
        self.init()
        self.view.backgroundColor = UIColor.mavPaleGreyTwo
        self.createTopBar(title: item.title)
        self.getItemDescription(item: item)
    }

    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.stopLoading()
    }

    func presentDescription(description: ItemDescription) {
        self.productDescription = ProductDescription(description: description)
        self.view.addSubview(self.productDescription)

        self.productDescription.autoPinEdge(.top, to: .bottom, of: self.topBar, withOffset: 0)
        self.productDescription.autoPinEdge(.left, to: .left, of: self.view, withOffset: 0)
        self.productDescription.autoPinEdge(.right, to: .right, of: self.view, withOffset: 0)
        self.productDescription.autoPinEdge(.bottom, to: .bottom, of: self.view, withOffset: 0)

        self.view.backgroundColor = UIColor.mercadoYellowBack
        self.productDescription.delegate = self
    }

    func getItemDescription(item: Item) {

        self.startLoading()
        ItemsManager.sharedInstance.getItemDescription(itemId:  item.id, responseHandler: { (succeeded, message, description) in
            if succeeded {
                self.presentDescription(description: description)
            } else {
                self.stopLoading()
                self.showErrorAlert(message)
            }
        })
    }
}
