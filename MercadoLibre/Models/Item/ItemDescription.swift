//
//  ItemDescription.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/7/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import Foundation
import SwiftyJSON

class ItemDescription: NSObject {

    var id: String = ""
    var created: String = ""
    var text: String = ""
    var plain_text: String = ""
    
    convenience init(json: JSON){
        self.init()
        
        if let id = json["id"].string {
            self.id = id
        }
        if let created = json["created"].string {
            self.created = created
        }
        if let text = json["text"].string {
            self.text = text
        }
        if let plain_text = json["plain_text"].string {
            self.plain_text = plain_text
        }
    }
}
