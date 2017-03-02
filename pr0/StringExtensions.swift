//
//  StringExtensions.swift
//  pr0
//
//  Created by Spykea on 02/03/2017.
//  Copyright © 2017 pr0gramm. All rights reserved.
//

import Foundation
import Alamofire

extension String: ParameterEncoding {

    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        request.httpBody = data(using: .utf8, allowLossyConversion: false)
        return request
    }

}
