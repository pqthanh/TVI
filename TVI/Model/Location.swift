//
//  Location.swift
//  TVI
//
//  Created by fwThanh on 12/25/17.
//  Copyright © 2017 PQT. All rights reserved.
//

import UIKit
import Foundation
import ObjectMapper

@objc(Location)
class Location: NSObject, NSCoding, Mappable {
    
    var code   : String?
    var name   : String?
    
    init(code : String, name : String) {
        self.code   = code
        self.name   = name
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.code = aDecoder.decodeObject(forKey: "code") as? String
        self.name = aDecoder.decodeObject(forKey: "name") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(code, forKey: "code")
        aCoder.encode(name, forKey: "name")
    }
    
    required init?(map: Map){
        super.init()
        code <- map["code"]
        name <- map["name"]
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        name <- map["name"]
    }
    
}
