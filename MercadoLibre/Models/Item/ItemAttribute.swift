//
//  ItemAttribute.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/3/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import Foundation
import SwiftyJSON

class ItemAttribute: NSObject {

    var id: String = ""
    var name: String = ""
    var value_id: String = ""
    var value_name: String = ""
    var attribute_group_id: String = ""
    var attribute_group_name: String = ""

    convenience init(json: JSON){
        self.init()
        
        if let id = json["id"].string {
            self.id = id
        }
        if let name = json["name"].string {
            self.name = name
        }
        if let value_id = json["value_id"].string {
            self.value_id = value_id
        }
        if let value_name = json["value_name"].string {
            self.value_name = value_name
        }
        if let attribute_group_id = json["attribute_group_id"].string {
            self.attribute_group_id = attribute_group_id
        }
        if let attribute_group_name = json["attribute_group_name"].string {
            self.attribute_group_name = attribute_group_name
        }
    }
}
