//
//  Sites.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/5/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import Foundation
import SwiftyJSON

class Site: NSObject {

    var id: String = ""
    var name: String = ""

    convenience init(json: JSON){
        self.init()

        if let id = json["id"].string {
            self.id = id
        }
        if let name = json["name"].string {
            self.name = name
        }
    }
}
