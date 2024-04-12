//
//  TimeManager.swift
//  WatchUI
//
//  Created by Dinko Nikolaev Kolev on 6/4/24.
//

import Foundation
import SwiftUI
import Combine

class TimeManager: ObservableObject {
    @Published var currentTime = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init() {
        // Subscribe to the timer to update the currentTime every second
        timer
            .sink { [weak self] _ in
                self?.currentTime = Date()
            }
            .store(in: &cancellables)
    }
    
    private var cancellables = Set<AnyCancellable>()
}
