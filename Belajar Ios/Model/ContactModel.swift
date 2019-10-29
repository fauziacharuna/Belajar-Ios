//
//  ContactModel.swift
//  Belajar Ios
//
//  Created by Fauzi Achmad Haruna on 29/10/19.
//  Copyright © 2019 Fauzi Achmad Haruna. All rights reserved.
//

import Foundation
struct ContactModel {
    var name: String?
    var role: String?
    init(name: String, role: String){
        self.name = name
        self.role = role
    }
}
