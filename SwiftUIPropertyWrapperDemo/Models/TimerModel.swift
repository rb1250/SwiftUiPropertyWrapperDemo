//
//  TimerModel.swift
//  SwiftUIPropertyWrapperDemo
//
//  Created by Ruchika Bokadia on 2025-07-09.
//
import SwiftUI

class TimerModel: ObservableObject {
    @Published var time = 0
    @Published var isRunning = false
    var timer: Timer?
        
    func start() {
        guard timer == nil else { return }
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.time += 1
        })
    }
    
    func stopTimerIfNeeded() {
        if let t = timer {
            t.invalidate()
            timer = nil
        }
    }
    
    func stop() {
        stopTimerIfNeeded()
        isRunning = false
    }
    
    func reset() {
        stopTimerIfNeeded()
        time = 0
    }
}
