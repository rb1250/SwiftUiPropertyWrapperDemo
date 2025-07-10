//
//  EnvironmentView.swift
//  SwiftUIPropertyWrapperDemo
//
//  Created by Ruchika Bokadia on 2025-07-09.
//
import SwiftUI

struct EnvironmentView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack(spacing: 24) {
            Text(colorScheme == .dark ? "🌙 Dark Mode" : "☀️ Light Mode")
                .font(.system(size: 50))
                .scaleEffect(colorScheme == .dark ? 1.2 : 1.0)
                .animation(.easeInOut, value: colorScheme)
            Text("Current Color Scheme: \(colorScheme == .dark ? "Dark" : "Light")")
                .font(.title2)
                .foregroundStyle(colorScheme == .dark ? .yellow : .blue)
        }
        .padding()
    }
}

#Preview {
    EnvironmentView()
}

// Notes: @Environment makes your view react to system-wide context without needing to pass data manually.
//🎯 Common Use Cases:
//Dark mode detection: @Environment(\.colorScheme)
//
//Dismiss keyboard/view: @Environment(\.dismiss)
//
//Layout decisions: @Environment(\.horizontalSizeClass)
//
//Read your own custom values (if defined)



