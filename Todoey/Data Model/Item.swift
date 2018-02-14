//
//  Item.swift
//  Todoey
//
//  Created by Magnus Eri Wærstad on 14.02.2018.
//  Copyright © 2018 Magnus Eri Wærstad. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}

