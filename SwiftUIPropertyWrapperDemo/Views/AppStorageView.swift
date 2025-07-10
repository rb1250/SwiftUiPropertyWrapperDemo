//
//  AppStorageView.swift
//  SwiftUIPropertyWrapperDemo
//
//  Created by Ruchika Bokadia on 2025-07-09.
//
import SwiftUI

struct AppStorageView: View {
    @AppStorage("username") private var username = "Guest"
    @State private var animate = false
    @State private var didAnimate = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome, \(username)")
                .font(.system(size: 34, weight: .semibold, design: .rounded))
                .bold()
                .rotation3DEffect(.degrees(animate ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                .animation(.easeInOut(duration: 1.5), value: animate)
            
            VStack(alignment: .leading, spacing: 8) {
                
                TextField("Enter your name", text: $username)
                    .font(.title3)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemGray6))
                    )
                    .padding(.horizontal)
                    .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
            }
        }
        .padding()
        .onAppear {
            if !didAnimate {
                animate = true
                didAnimate = true
            }
        }
        .onChange(of: username) { oldValue, newValue in
            animate.toggle()
        }
    }
}

#Preview {
    AppStorageView()
}

// Notes: @AppStorage reads and writes user preferences directly to UserDefaults — automatically persisting data across launches.

//🎯 Perfect Use Cases:
//Theme preference (dark/light)

//Remembering username

//First-time onboarding toggle

//Language selection


//@AppStorage is a quick way to persist simple user settings without manual UserDefaults code.

