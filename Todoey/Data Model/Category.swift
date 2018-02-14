//
//  Category.swift
//  Todoey
//
//  Created by Magnus Eri Wærstad on 14.02.2018.
//  Copyright © 2018 Magnus Eri Wærstad. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
    
}
