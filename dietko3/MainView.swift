//
//  MainView.swift
//  dietko3
//
//  Created by Grant Gillespie on 11/11/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem { Label("Dashboard", systemImage: "gauge.with.needle") }
            LogView()
                .tabItem { Label("Log", systemImage: "list.dash") }
        }
    }
}

#Preview {
    MainView()
}
