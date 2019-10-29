//
//  Contact.swift
//  Belajar Ios
//
//  Created by Fauzi Achmad Haruna on 18/10/19.
//  Copyright © 2019 Fauzi Achmad Haruna. All rights reserved.
//

import Foundation
struct ContactGroup {
    var section: String
    var items : [[String:Any]]
    init(section: String, items: [[String:Any]]) {
        self.section = section
        self.items = items
    }
}
