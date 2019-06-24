//
//  ItemManager.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/4/17.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import Alamofire
import SwiftyJSON

class ItemsManager: NSObject {

    static let sharedInstance = ItemsManager()

    func getItemData(item: Item, responseHandler: @escaping (_ succeeded: Bool, _ msg: String, _ item: Item, _ category: Category) -> ()) {

        let group = DispatchGroup()
        var item_data: Item = Item()
        var category_data: Category = Category()
        var msg_data = ""
        var succeeded_data = true

        group.enter()
        self.getItemDetails(itemId: item.id, responseHandler: { (succeeded, message, item_response) in
            if succeeded {
                item_data = item_response
                item_data.installments = item.installments
            } else {
                msg_data = message
                succeeded_data = false
            }

            succeeded_data = succeeded
            group.leave()
        })

        group.enter()
        self.getItemCategory(categoryId: item.category_id, responseHandler: { (succeeded, message, category) in
            if succeeded {
                category_data = category
            } else {
                msg_data = message
                succeeded_data = false
            }

            succeeded_data = succeeded
            group.leave()
        })

        group.notify(queue: .main) {
            responseHandler(succeeded_data, msg_data, item_data, category_data)
        }
    }

    func getItemDetails(itemId: String, responseHandler: @escaping (_ succeeded: Bool, _ msg: String, _ item: Item) -> ()) {

        let url = ServicesManager.sharedInstance.buildUrl(url: Config.sharedInstance.url_items_details.replace(target: "{item}", withString: itemId))

        ServicesManager.sharedInstance.useService(method: .get, url: url, paramaters: nil) { (succeeded, response) -> Void in
            if succeeded {
                if let result = response {
                    let item = Item(json: result)
                    responseHandler(true, "", item)
                } else {
                    responseHandler(false, "item_list_error".localized, Item())
                }
            } else {
                responseHandler(false, "item_list_error".localized, Item())
            }
        }
    }

    func getItemCategory(categoryId: String, responseHandler: @escaping (_ succeeded: Bool, _ msg: String, _ category: Category) -> ()) {
        
        let url = ServicesManager.sharedInstance.buildUrl(url: Config.sharedInstance.url_category_details.replace(target: "{category}", withString: categoryId))

        ServicesManager.sharedInstance.useService(method: .get, url: url, paramaters: nil) { (succeeded, response) -> Void in
            if succeeded {
                if let result = response {
                    let category = Category(json: result)
                    responseHandler(true, "", category)
                } else {
                    responseHandler(false, "categories_list_error".localized, Category())
                }
            } else {
                responseHandler(false, "categories_list_error".localized, Category())
            }
        }
    }

    func getItemDescription(itemId: String, responseHandler: @escaping (_ succeeded: Bool, _ msg: String, _ description: ItemDescription) -> ()) {

        let url = ServicesManager.sharedInstance.buildUrl(url: Config.sharedInstance.url_itmems_description.replace(target: "{item}", withString: itemId))

        ServicesManager.sharedInstance.useService(method: .get, url: url, paramaters: nil) { (succeeded, response) -> Void in
            if succeeded {
                if let result = response {
                    let description = ItemDescription(json: result)
                    responseHandler(true, "", description)
                } else {
                    responseHandler(false, "description_list_error".localized, ItemDescription())
                }
            } else {
                responseHandler(false, "description_list_error".localized, ItemDescription())
            }
        }
    }
}
