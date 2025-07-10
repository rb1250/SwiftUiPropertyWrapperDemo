//
//  BindingParentView.swift
//  SwiftUIPropertyWrapperDemo
//
//  Created by Ruchika Bokadia on 2025-07-09.
//
import SwiftUI

// Binding View
struct BindingParentView: View {
    @State private var isOn = false
    @State private var showBanner = false
    @State private var bannerText = ""
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                if showBanner {
                    Text(bannerText)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .transition(.move(edge: .top).combined(with: .opacity))
                }
                BindingView(isOn: $isOn)
            }
            .padding()
            Text("Switch is \(isOn ? "ON" : "OFF")")
        }
        .padding()
        .animation(.easeInOut, value: showBanner)
        .onChange(of: isOn) { oldValue, newValue in
            print(oldValue, newValue)
            bannerText = "🔔 isOn changed to \(newValue ? "ON" : "OFF")"
            showBanner = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                showBanner = false
            }
        }
    }
}

#Preview {
    BindingParentView()
}

// Notes: Use .onChange + @State + DispatchQueue to create temporary UI reactions to state changes.
