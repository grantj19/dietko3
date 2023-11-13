//
//  ContentView+Observed.swift
//  dietko3
//
//  Created by Grant Gillespie on 9/19/23.
//

import SwiftUI

extension ContentView {
    class Observed: ObservableObject {
        
        @Published var user = User()
        
        func fetchUser(completion: (Error?) -> ()){
            let user = User(name: "Grant")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                self.user = user
            }
        }
        
    }
}
