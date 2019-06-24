//
//  ProductViewController.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/6/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import UIKit

class ProductViewController: BaseViewController {

    var item: Item!
    var productView = ProductView()

    // MARK: Lifecycle
    convenience init(item: Item) {
        self.init()
        self.item = item
        self.view.backgroundColor = UIColor.mavPaleGreyTwo
        self.createTopBar(title: item.title)
        self.getItemDetails(item: item)
    }

    func presentProduct(item: Item, category: Category) {

        let itemCurrency = MercadoManager.sharedInstance.getCurrencyById(currencyId: item.currency_id)
        let installmentsCurrency = MercadoManager.sharedInstance.getCurrencyById(currencyId: item.installments.currency_id)

        self.productView = ProductView(item: item, itemCurrency: itemCurrency, installmentsCurrency: installmentsCurrency, category: category)
        let showImageAction = UITapGestureRecognizer(target: self, action: #selector(self.showImage))
        self.productView.slideshow.addGestureRecognizer(showImageAction)
        self.productView.details.descriptionLink.addTarget(self, action: #selector(showDescription), for: UIControlEvents.touchUpInside)
        self.view.addSubview(productView)

        productView.autoPinEdge(.top, to: .bottom, of: self.topBar, withOffset: 0)
        productView.autoPinEdge(.left, to: .left, of: self.view, withOffset: 0)
        productView.autoPinEdge(.right, to: .right, of: self.view, withOffset: 0)
        productView.autoPinEdge(.bottom, to: .bottom, of: self.view, withOffset: 0)

        self.view.backgroundColor = UIColor.mercadoYellowBack
    }

    func getItemDetails(item: Item) {

        self.startLoading()
        ItemsManager.sharedInstance.getItemData(item: item, responseHandler: { (succeeded, msg, item, category) in
            if succeeded {
                self.stopLoading()
                self.presentProduct(item: item, category: category)
            } else {
                self.stopLoading()
                self.showErrorAlert(msg)
            }
        })
    }

    func showDescription() {
        if let mainNavigationController = self.navigationController {
            mainNavigationController.pushViewController(DescriptionViewController(item: self.item), animated: true)
        }
    }

    func showImage() {
        self.productView.slideshow.presentFullScreenController(from: self)
    }
}
