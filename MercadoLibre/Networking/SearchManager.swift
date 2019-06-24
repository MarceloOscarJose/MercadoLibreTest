//
//  SearchManager.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/7/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import Alamofire
import SwiftyJSON

class SearchManager: NSObject {

    static let sharedInstance = SearchManager()

    static func searchItems(searchCriteria: String, offset: Int, responseHandler: @escaping (_ succeeded: Bool, _ msg: String, _ search: Search) -> ()) {

        var site: String = Config.sharedInstance.api_site

        if let defaultSite = Config.sharedInstance.getDefaulstSite() {
            site = defaultSite
        }

        let url = ServicesManager.sharedInstance.buildUrl(url: Config.sharedInstance.url_search.replace(target: "{site}", withString: site))

        let searchParameters = [
            "q": searchCriteria as AnyObject,
            "limit": Config.sharedInstance.api_limit as AnyObject,
            "offset": offset as AnyObject
        ] as [String : AnyObject]

        ServicesManager.sharedInstance.useService(method: .get, url: url, paramaters: searchParameters) { (succeeded, response) -> Void in

            if succeeded {
                if let results = response {

                    let search = Search(json: results)

                    if search.results.count > 0 {

                        MercadoManager.sharedInstance.listCurrencies(responseHandler: { (succeeded, msg, currencies) in
                            if succeeded {
                                responseHandler(true, "", search)
                            } else {
                                responseHandler(false, msg, Search())
                            }
                        })
                    } else {
                        responseHandler(false, "noresults_list_error".localized, Search())
                    }
                } else {
                    responseHandler(false, "item_list_error".localized, Search())
                }
            } else {
                responseHandler(false, "item_list_error".localized, Search())
            }
        }
    }
}
