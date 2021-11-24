//
//  CoordsModel.swift
//  frameworks
//
//  Created by iMac on 13.11.2021.
//  Copyright © 2021 AVIlyushin. All rights reserved.
//

import Foundation
import RealmSwift

class CoordsModel: Object {
    @objc dynamic var lat : String? = nil
    @objc dynamic var long : String? = nil
}
