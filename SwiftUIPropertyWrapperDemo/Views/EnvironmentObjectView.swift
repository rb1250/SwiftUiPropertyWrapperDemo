//
//  EnvironmentObjectView.swift
//  SwiftUIPropertyWrapperDemo
//
//  Created by Ruchika Bokadia on 2025-07-09.
//
import SwiftUI

struct EnvironmentObjectView: View {
    @EnvironmentObject var settings: UserSettings
    @State private var animate = false
    var body: some View {
        VStack(spacing: 20) {
            Text("Score: \(settings.score)")
                .font(.system(size: 40, weight: .bold))
                .scaleEffect(animate ? 1.2 : 1)
                .animation(.spring(), value: animate)
            
            Stepper(value: $settings.score) {
                Text("Increase Score")
                    .font(.title2)
                    .fontWeight(.medium)
            }
            .padding()
        }
        .padding()
        .onChange(of: settings.score) { oldValue, newValue in
            animate = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                animate = false
            }
        }
    }
}

#Preview {
    EnvironmentObjectView()
        .environmentObject(UserSettings())
}

// Notes: 👥 @EnvironmentObject — Shared Data Across Many Views

//@EnvironmentObject lets you share a single instance of data across multiple views without passing it manually.
//
//📦 Typical Use:
//Shared user settings
//Auth/session management
//Cart, favorites, scores, or app-wide state

// @EnvironmentObject is like a shared brain — every view can observe and modify it, and SwiftUI will auto-refresh.


