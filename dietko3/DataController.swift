//
//  DataController.swift
//  dietko3
//
//  Created by Grant Gillespie on 11/11/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "DietKO")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("CoreData failes to load: \(error.localizedDescription)")
            }}
    }
}
