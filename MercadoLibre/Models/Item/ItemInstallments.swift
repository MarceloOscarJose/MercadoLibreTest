//
//  ItemInstallments.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/5/17.
//  Copyright © 2017 Marcelo Oscar José. All rights reserved.
//

import Foundation
import SwiftyJSON

class ItemInstallments: NSObject {

    var quantity: Int = 0
    var amount: Double = 0
    var currency_id: String = ""
    
    convenience init(json: JSON){
        self.init()

        if let quantity = json["quantity"].int {
            self.quantity = quantity
        }
        if let amount = json["amount"].double {
            self.amount = amount
        }
        if let currency_id = json["currency_id"].string {
            self.currency_id = currency_id
        }
    }
}
