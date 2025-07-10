//
//  SwiftUIPropertyWrapperDemoApp.swift
//  SwiftUIPropertyWrapperDemo
//
//  Created by Ruchika Bokadia on 2025-07-09.
//

import SwiftUI

@main
struct SwiftUIPropertyWrapperDemoApp: App {
    @StateObject private var settings = UserSettings()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settings)
        }
    }
}
