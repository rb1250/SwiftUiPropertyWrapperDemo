//
//  PublishedView.swift
//  SwiftUIPropertyWrapperDemo
//
//  Created by Ruchika Bokadia on 2025-07-09.
//
import SwiftUI

struct PublishedView: View {
    @StateObject private var timerModel = TimerModel()
    
    var body: some View {
        VStack(spacing: 24) {
            Text(timerModel.isRunning ? "⏱ Running" : "⏹ Stopped")
                .font(.headline)
                .foregroundStyle(timerModel.isRunning ? .green : .red)
            
            Text("\(timerModel.time) seconds")
                .font(.system(size: 44, weight: .bold))
                .monospacedDigit()
            
            HStack(spacing: 24) {
                Button {
                    timerModel.isRunning ? timerModel.stop() : timerModel.start()
                } label: {
                    Text(timerModel.isRunning ? "Stop" : "Start")
                }
                .buttonStyle(.borderedProminent)
                
                Button {
                    timerModel.reset()
                } label: {
                    Text("Reset")
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
    }
}

#Preview {
    PublishedView()
}

// Notes: ✅ @Published marks properties inside a class that notify SwiftUI views to update whenever they change.
