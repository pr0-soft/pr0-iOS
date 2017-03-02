//
//  APIRequests.swift
//  pr0
//
//  Created by Spykea on 02/03/2017.
//  Copyright © 2017 pr0gramm. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class APIRequests {

    static let baseUrl = "https://pr0gramm.com"
    static let thumbUrl = "https://thumb.pr0gramm.com"

    static func getItems(tabType: PostTabType? = nil, flags: Int, newer: Int? = nil, older: Int?, completion: ((_ success: Bool, _ items: Items?) -> Void)? = nil) {
        let url = "\(baseUrl)/api/items/get"

        var parameters: [String: String] = [:]

        parameters["flags"] = String(flags)

        if let newer = newer {
            parameters["newer"] = String(newer)
        } else if let older = older {
            parameters["older"] = String(older)
        }

        if tabType == .top {
            parameters["promoted"] = "true"
        }

        Alamofire.request(url, method: .get, parameters: parameters).responseObject { (response: DataResponse<Items>) in
            if let val = response.result.value {
                completion?(true, val)
            } else {
                completion?(false, nil)
            }
        }
    }
}
