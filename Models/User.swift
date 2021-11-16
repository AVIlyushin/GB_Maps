//
//  User.swift
//  frameworks
//
//  Created by iMac on 13.11.2021.
//  Copyright © 2021 AVIlyushin. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var login : String? = nil
    @objc dynamic var password : String? = nil
    
    override static func primaryKey() -> String? {
        return "login"
    }
}
