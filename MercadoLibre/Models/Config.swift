//
//  Config.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/9/17.
//  Copyright © 2017 Marcelo Oscar José. All rights reserved.
//

import Foundation

class Config: NSObject {

    static let sharedInstance = Config()

    var api_url: String = ""
    var api_site: String = ""
    var api_limit: Int = 30

    // Item Data
    let url_search = "sites/{site}/search"
    let url_items_details = "items/{item}"
    let url_itmems_description = "items/{item}/description"
    let url_category_details = "categories/{category}"

    // General Data
    let url_sites_list = "sites"
    let url_currencies_list = "currencies"

    override private init() {

        if let path = Bundle.main.path(forResource: "Configuration", ofType: "plist") {
            self.api_url = (NSDictionary(contentsOfFile: path)?.object(forKey: "api_url") as! String?)!
            self.api_site = (NSDictionary(contentsOfFile: path)?.object(forKey: "api_site") as! String?)!
            self.api_limit = (NSDictionary(contentsOfFile: path)?.object(forKey: "api_limit") as! Int?)!
        }
    }

    func getDefaulstSite() -> String? {
        let defaults = UserDefaults.standard

        if let site = defaults.string(forKey: "site") {
            return site
        }

        return nil
    }
}
