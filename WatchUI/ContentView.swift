//
//  ContentView.swift
//  WatchUI
//
//  Created by Dinko Nikolaev Kolev on 6/4/24.
//

import SwiftUI
import Combine

struct ContentView: View {
//    @State var day = Date().formatted(.dateTime.year(.twoDigits).month(.wide).day())
//    @State var time = Date().formatted(.dateTime.hour().minute().second())
    let timer2 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
//            Text(day)
//                .onReceive(timer2) { _ in
//                    self.day = Date().formatted(.dateTime.year(.twoDigits).month(.wide).day())
//                }
//            Text(time)
//                .onReceive(timer2) { _ in
//                    self.time = Date().formatted(.dateTime.hour().minute().second())
//                }
            watchView()
        }
        .padding()
        Spacer()
        
        
        
        
        
    }
}

#Preview {
    ContentView()
}
