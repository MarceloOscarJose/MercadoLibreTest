//
//  String.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/6/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import Foundation

public extension String {

    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }

    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
}
