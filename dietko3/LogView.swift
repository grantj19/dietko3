//
//  LogView.swift
//  dietko3
//
//  Created by Grant Gillespie on 11/12/23.
//

import SwiftUI

struct LogView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date)]) var calorieLogs: FetchedResults<CalorieLog>
    
    var body: some View {
        VStack{
            Grid{
                GridRow{
                    Text("Calories")
                    Text("Date")
                }
                .bold()
                Divider()
                List{
                    ForEach(calorieLogs) { log in
                        HStack{
                            Text(log.count, format: .number)
                            Spacer()
                            Text(log.date!, format: .dateTime)
                        }
                    }
                    .onDelete(perform: deleteLog)
                }

            }
        }
    }
    
    private func deleteLog(at offsets: IndexSet){
        for index in offsets {
            let log = calorieLogs[index]
            moc.delete(log)
        }
    }
}

#Preview {
    LogView()
}
