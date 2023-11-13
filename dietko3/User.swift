//
//  User.swift
//  dietko3
//
//  Created by Grant Gillespie on 9/19/23.
//

import SwiftUI

struct User: Identifiable {
    var id = UUID()
    var createdDate: Date
    var name: String
    
    init(createdDate: Date? = nil, name: String? = nil){
        self.createdDate = createdDate ?? Date()
        self.name = name ?? ""
    }
}
