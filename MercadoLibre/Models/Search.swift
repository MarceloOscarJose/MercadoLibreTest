//
//  Search.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/7/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import Foundation
import SwiftyJSON

class Search: NSObject {

    var site_id: String = ""
    var query: String = ""
    var paging: SearchPaging = SearchPaging()
    var results: [Item] = []

    convenience init(json: JSON){
        self.init()

        if let site_id = json["site_id"].string {
            self.site_id = site_id
        }
        if let query = json["query"].string {
            self.query = query
        }
        if let results = json["results"].array {
            for result in results {
                self.results.append(Item(json: result))
            }
        }

        self.paging = SearchPaging(json: json["paging"])
    }
}

class SearchPaging: NSObject {
    var total: Int = 0
    var offset: Int = 0
    var limit: Int = 0

    convenience init(json: JSON){
        self.init()
        
        if let total = json["total"].int {
            self.total = total
        }
        if let offset = json["offset"].int {
            self.offset = offset
        }
        if let limit = json["limit"].int {
            self.limit = limit
        }
    }
}
