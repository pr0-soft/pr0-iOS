//
//  Items.swift
//  pr0
//
//  Created by Spykea on 02/03/2017.
//  Copyright © 2017 pr0gramm. All rights reserved.
//

import Foundation
import ObjectMapper

class Items: Mappable {

    var atEnd: Bool?
    var atStart: Bool?
    var ts: Int?
    var cache: String?
    var rt: Int?
    var qc: Int?
    var items: [Item]?

    required init?(map: Map) {
    }

    // Mappable
    func mapping(map: Map) {
        atEnd <- map["atEnd"]
        atStart <- map["atStart"]
        ts <- map["ts"]
        cache <- map["cache"]
        rt <- map["rt"]
        qc <- map["qc"]
        items <- map["items"]
    }
}

class Item: Mappable {

    var id: Int?

    var promoted: Int?
    var up: Int?
    var down: Int?

    var created: Int?
    var image: String?
    var thumb: String?
    var fullsize: String?

    var width: Int?
    var height: Int?

    var audio: Bool?
    var source: String?
    var flags: Int?

    var user: String?

    var mark: Int?

    required init?(map: Map) {
    }

    // Mappable
    func mapping(map: Map) {
        id <- map["id"]
        promoted <- map["promoted"]
        up <- map["up"]
        down <- map["down"]
        created <- map["created"]
        image <- map["image"]
        thumb <- map["thumb"]
        fullsize <- map["fullsize"]
        width <- map["width"]
        height <- map["height"]
        audio <- map["audio"]
        source <- map["source"]
        flags <- map["flags"]
        user <- map["user"]
        mark <- map["mark"]
    }
}
