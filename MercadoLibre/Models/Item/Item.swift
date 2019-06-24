//
//  User.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/3/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import Foundation
import SwiftyJSON

class Item: NSObject {

    var id: String = ""
    var title: String = ""
    var price: Double = 0
    var installments: ItemInstallments = ItemInstallments()
    var thumbnail: String = ""
    var currency_id: String = ""
    var pictures: [ItemPicture] = []
    var attributes: [ItemAttribute] = []
    var warranty: String = ""
    var category_id: String = ""

    convenience init(json: JSON){
        self.init()

        if let id = json["id"].string {
            self.id = id
        }
        if let title = json["title"].string {
            self.title = title
        }
        if let price = json["price"].double {
            self.price = price
        }
        if let thumbnail = json["thumbnail"].string {
            self.thumbnail = thumbnail
        }
        if let currency_id = json["currency_id"].string {
            self.currency_id = currency_id
        }
        if let pictures = json["pictures"].array {
            for picture in pictures {
                self.pictures.append(ItemPicture(json: picture))
            }
        }
        if let attributes = json["attributes"].array {
            for attribute in attributes {
                self.attributes.append(ItemAttribute(json: attribute))
            }
        }
        if let warranty = json["warranty"].string {
            self.warranty = warranty
        }
        if let category_id = json["category_id"].string {
            self.category_id = category_id
        }

        self.installments = ItemInstallments(json: json["installments"])
    }
}
