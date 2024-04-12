//
//  watchView.swift
//  WatchUI
//
//  Created by Dinko Nikolaev Kolev on 6/4/24.
//

import SwiftUI
import Combine

struct watchView: View {
    
    
    @State private var currentTime = Date()
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    // Constants for watch dimensions and colors
    let watchRadius: CGFloat = 100
    let hourHandLength: CGFloat = 50
    let minuteHandLength: CGFloat = 70
    let secondHandLength: CGFloat = 80
    let handWidth: CGFloat = 4
    let watchFaceColor = LinearGradient(gradient: Gradient(colors: [.white, .mint, .green]),startPoint: .zero, endPoint: .bottom)
    let handColor = LinearGradient(gradient: Gradient(colors: [ .black, .white]),startPoint: .bottom , endPoint: .topTrailing)
   
    var body: some View {
        let calendar = Calendar.current
        let seconds = CGFloat(calendar.component(.second, from: currentTime))
        let minutes = CGFloat(calendar.component(.minute, from: currentTime))
        let hours = CGFloat(calendar.component(.hour, from: currentTime))
        
        return ZStack {
            
            
//         
            // Watch face
                       Circle()
                           .stroke(AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center, startAngle: .zero, endAngle: .degrees(360)), lineWidth: 60)
                           .fill(watchFaceColor)
                           .frame(width: watchRadius * 2, height: watchRadius * 2)
                           .background(
                              
                           )
            
            
        //  Black Square
            Circle()
                .stroke(AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center, startAngle: .zero, endAngle: .degrees(360)), lineWidth: 60)
                .fill(watchFaceColor)
                .frame(width: watchRadius * 2, height: watchRadius * 2)
                .background(
                    .black
                )
            
            Circle()
                .trim(from: 0, to: 1)
                .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .foregroundColor(.white)
                .frame(width: watchRadius * 2.6, height: watchRadius * 2.6)
            
            
            
            Circle()
                .trim(from: 0, to: 1)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .foregroundColor(.white)
                .frame(width: watchRadius * 2, height: watchRadius * 2)
                .overlay(
                   Path { path in
                       for i in stride(from: 0, to: 360, by: 30) {
                           let start = CGPoint(x: watchRadius * cos(CGFloat(i) * .pi / 180), y: watchRadius * sin(CGFloat(i) * .pi / 180))
                           let end = CGPoint(x: (watchRadius + 10) * cos(CGFloat(i) * .pi / 180), y: (watchRadius + 10) * sin(CGFloat(i) * .pi / 180))
                           path.move(to: start)
                           path.addLine(to: end)
                       }
                   }
                       .trim(from: 0, to: 1)
                       .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round))
                       .rotationEffect(.degrees(0))
                       .foregroundColor(.gray)
                       .frame(width: watchRadius , height: watchRadius )
                       .offset(x:  watchRadius - 50, y:  watchRadius - 50) // Adjust position here
               )
   
            // Hour hand
            Rectangle()
                .fill(handColor)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                .frame(width: handWidth, height: hourHandLength)
                .offset(y: -hourHandLength / 2)
                .rotationEffect(.degrees((hours * 30) + (minutes / 2)))
            
            // Minute hand
            Rectangle()
                .fill(handColor)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                .frame(width: handWidth, height: minuteHandLength)
                .offset(y: -minuteHandLength / 2)
                .rotationEffect(.degrees((minutes * 6) + (seconds / 10)))
            
            // Second hand
            Rectangle()
                .fill(handColor)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                .frame(width: handWidth, height: secondHandLength)
                .offset(y: -secondHandLength / 2)
                .rotationEffect(.degrees(seconds * 6))
            
            // Center dot
            Circle()
                .fill(handColor)
                .frame(width: 8, height: 8)
        }
        .onReceive(timer) { _ in
            self.currentTime = Date()
        }
    }
}


#Preview {
    watchView()
}
