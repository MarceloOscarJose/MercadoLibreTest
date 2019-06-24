//
//  MercadoManager.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/6/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import Foundation

class MercadoManager: NSObject {

    static let sharedInstance = MercadoManager()

    var sitesList:[Site] = []
    var currenciesList:[Currency] = []

    private override init() {
    }

    func listSites(responseHandler: @escaping (_ succeeded: Bool, _ msg: String, _ sites: [Site]) -> ()) {

        if sitesList.count == 0 {

            let url = ServicesManager.sharedInstance.buildUrl(url: Config.sharedInstance.url_sites_list)

            ServicesManager.sharedInstance.useService(method: .get, url: url, paramaters: nil) { (succeeded, response) -> Void in
                if succeeded {
                    if let results = response {

                        for site in results.array! {
                            self.sitesList.append(Site(json: site))
                        }

                        responseHandler(true, "", self.sitesList)
                    } else {
                        responseHandler(false, "site_list_error".localized, [Site()])                        
                    }
                } else {
                    responseHandler(false, "site_list_error".localized, [Site()])
                }
            }
        } else {
            responseHandler(true, "", self.sitesList)
        }
    }

    func listCurrencies(responseHandler: @escaping (_ succeeded: Bool, _ msg: String, _ currencies: [Currency]) -> ()) {
        
        if currenciesList.count == 0 {

            let url = ServicesManager.sharedInstance.buildUrl(url: Config.sharedInstance.url_currencies_list)

            ServicesManager.sharedInstance.useService(method: .get, url: url, paramaters: nil) { (succeeded, response) -> Void in
                if succeeded {
                    if let results = response {

                        for currency in results.array! {
                            self.currenciesList.append(Currency(json: currency))
                        }

                        responseHandler(true, "", self.currenciesList)
                    } else {
                        responseHandler(false, "currency_list_error".localized, [Currency()])
                    }
                } else {
                    responseHandler(false, "currency_list_error".localized, [Currency()])
                }
            }
        } else {
            responseHandler(true, "", self.currenciesList)
        }
    }
    
    func getCurrencyById(currencyId: String) -> Currency {

        var currencyData = Currency()

        for currency in self.currenciesList {
            if currency.id == currencyId {
                currencyData = currency
            }
        }

        return currencyData
    }
}
