//
//  ContentView.swift
//  dietko3
//
//  Created by Grant Gillespie on 9/19/23.
//

import SwiftUI

struct Background<Content: View>: View {
    private var content: Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    var body: some View {
        Color(UIColor.systemBackground) // Need to adjust based on theme
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .overlay(content)
    }
}

struct ContentView: View {
    @StateObject private var observed = Observed()
    @State public var input: Int? = nil
    @FetchRequest(sortDescriptors: []) var calorieLogs: FetchedResults<CalorieLog>
    @Environment(\.managedObjectContext) var moc
    
    var currentCount: Int32 {
        calorieLogs.reduce(0) { $0 + $1.count }
    }
    
    var body: some View {
        Background {
            VStack {
                Gauge(value: Float(currentCount), in: 0...2500) {
                    Image(systemName: "gauge.medium")
                        .font(.system(size: 50.0))
                } currentValueLabel: {
                    Text("\(currentCount.formatted(.number))")
         
                }
                .gaugeStyle(CalorieGaugeStyle())
                
                TextField("Input", value: $input, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .frame(width: 150)
                
                Button("Add") {
                    let calorieLog = CalorieLog(context: moc)
                    calorieLog.count = Int32(input!)
                    calorieLog.date = Date()
                    
                    try? moc.save()
                    
                }
    //            Image(systemName: "globe")
    //                .imageScale(.large)
    //                .foregroundStyle(.tint)
    //            Text("Hello, User \(self.observed.user.name)!")
                
            }
        }
        .onTapGesture {
            self.endEditing()
        }
//        .onAppear {
//            fetchUser()
//        }
    }
    
    private func endEditing(){
        UIApplication.shared.endEditing()
    }
    
//    func fetchUser(){
//        self.observed.fetchUser { err in
//            if let err = err {
//                print(err.localizedDescription)
//                return
//            }
//        }
//    }
}

extension UIApplication {
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    ContentView()
}
