//
//  Currency.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/3/17.
//  Copyright © 2216 Marcelo Oscar José. All rights reserved.
//

import Foundation
import SwiftyJSON

class Currency: NSObject {

    var id: String = ""
    var symbol: String = ""
    var name: String = ""
    var decimal_places: Int = 0

    var items:[Currency] = []

    convenience init(json: JSON) {

        self.init()

        if let id = json["id"].string {
            self.id = id
        }
        if let symbol = json["symbol"].string {
            self.symbol = symbol
        }
        if let name = json["description"].string {
            self.name = name
        }
        if let decimal_places = json["decimal_places"].int {
            self.decimal_places = decimal_places
        }
    }
}
