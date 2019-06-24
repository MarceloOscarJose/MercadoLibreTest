//
//  ServicesManager.swift
//  MercadoLibre
//
//  Created by Marcelo Oscar José on 1/3/16.
//  Copyright © 2016 Marcelo Oscar José. All rights reserved.
//

import Alamofire
import SwiftyJSON

class ServicesManager: NSObject {

    static let sharedInstance = ServicesManager()

    func buildUrl(url: String) -> String {
        return Config.sharedInstance.api_url + url
    }

    func useService(method: Alamofire.HTTPMethod, url: String, paramaters: [String: AnyObject]?, responseHandler: @escaping (_ succeeded: Bool, _ response: JSON?) -> Void){
        let headers = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        
        self.useService(method: method, url: url, paramaters: paramaters, headers: headers, responseHandler: responseHandler)
    }

    private func useService(method: Alamofire.HTTPMethod, url: String, paramaters: [String: AnyObject]?, encoding: Alamofire.ParameterEncoding = JSONEncoding.default, headers: [String: String], responseHandler:@escaping (_ succeeded: Bool, _ response: JSON?) -> Void){

        let finalURL = URL(string: url)!
        var requestEnconding = encoding

        print("URL: \(url)")
        print("Method: \(method)")
        print("Headers: \(headers)")
        print("Request: \(paramaters)")

        if method == Alamofire.HTTPMethod.get && paramaters != nil {
            requestEnconding = URLEncoding.default
        }

        Alamofire.request(finalURL, method: method, parameters: paramaters, encoding: requestEnconding, headers: headers).response(completionHandler: { (response) in

            if let _ = response.error {
                responseHandler(false, nil)
                return
            }

            if let responseValue = response.data {

                let json = JSON(data: responseValue)

                if response.response?.statusCode != 200 {
                    responseHandler(false, json)
                    return
                }

                if json.error != nil {
                    responseHandler(false, json)
                } else {
                    responseHandler(true, json)
                }
            } else {
                responseHandler(false, nil)
            }
        })
    }
}
