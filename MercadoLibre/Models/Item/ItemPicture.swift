//
//  ItemPicture.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/6/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import Foundation
import SwiftyJSON

class ItemPicture: NSObject {

    var id: String = ""
    var url: String = ""
    var secure_url: String = ""
    var size: String = ""
    var max_size: String = ""
    var quality: String = ""

    convenience init(json: JSON){
        self.init()
        
        if let id = json["id"].string {
            self.id = id
        }
        if let url = json["url"].string {
            self.url = url
        }
        if let secure_url = json["secure_url"].string {
            self.secure_url = secure_url
        }
        if let size = json["size"].string {
            self.size = size
        }
        if let max_size = json["max_size"].string {
            self.max_size = max_size
        }
        if let quality = json["quality"].string {
            self.quality = quality
        }
    }
}
