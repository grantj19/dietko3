//
//  dietko3App.swift
//  dietko3
//
//  Created by Grant Gillespie on 9/19/23.
//

import SwiftUI

@main
struct dietko3App: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
