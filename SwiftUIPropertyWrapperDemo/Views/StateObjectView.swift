//
//  StateObjectView.swift
//  SwiftUIPropertyWrapperDemo
//
//  Created by Ruchika Bokadia on 2025-07-09.
//
import SwiftUI

struct StateObjectView: View {
    @StateObject private var model = TimerModel()
    
    var body: some View {
        VStack(spacing: 24) {
            Text(model.isRunning ? "🔥 Timer Running" : "⏸️ Paused")
                .font(.headline)
                .foregroundStyle(model.isRunning ? .green : .red)
            
            Text("\(model.time) s")
                .font(.system(size: 48, weight: .bold))
                .monospacedDigit()
                .foregroundStyle(.orange)
            
            HStack(spacing: 24) {
                Button(model.isRunning ? "Stop" : "Start") {
                    model.isRunning ? model.stop() : model.start()
                }
                .buttonStyle(.borderedProminent)
                
                Button("Reset") {
                    model.reset()
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
    }
}

#Preview {
    StateObjectView()
}

// Notes: @StateObject is used when a view needs to create and own an observable class — and persist it across updates.
