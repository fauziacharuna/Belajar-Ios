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
    var items : [ContactModel]
    init(section: String, items: [ContactModel]) {
        self.section = section
        self.items = items
    }
}
