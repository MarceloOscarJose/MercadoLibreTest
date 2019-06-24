//
//  Category.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/3/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import Foundation
import SwiftyJSON

class Category: NSObject {
    
    var id: String = ""
    var name: String = ""
    var path_from_root: [Category] = []

    var items:[Category] = []

    convenience init(json: JSON) {

        self.init()

        if let id = json["id"].string {
            self.id = id
        }
        if let name = json["name"].string {
            self.name = name
        }
        if let categories = json["path_from_root"].array {
            for category in categories {
                self.path_from_root.append(Category(json: category))
            }
        }
    }
}
