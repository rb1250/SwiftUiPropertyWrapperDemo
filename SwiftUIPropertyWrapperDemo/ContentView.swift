//
//  ContentView.swift
//  SwiftUIPropertyWrapperDemo
//
//  Created by Ruchika Bokadia on 2025-07-09.
//

import SwiftUI

// MARK: - Tab Enum
enum AppTab: Hashable {
    case appStorage
    case state
    case binding
    case environment
    case environmentObject
    case observed
    case published
    case sceneStorage
    case namespace
    case gestureState
    // Add more as needed
}

struct ContentView: View {
    @State private var selectedTab: AppTab = .appStorage
    @StateObject private var timerModel = TimerModel()
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("AppStorage", systemImage: "folder", value: .appStorage) {
                AppStorageView()
            }
            
            Tab("StateView", systemImage: "circle.fill", value: .state) {
                StateView()
            }
            
            Tab("Binding", systemImage: "link", value: .binding) {
                BindingParentView()
            }
            
            Tab("Environment", systemImage: "globe", value: .environment) {
                EnvironmentView()
            }
            
            Tab("EnvObject", systemImage: "person.3", value: .environmentObject) {
                EnvironmentObjectView()
            }
            
            Tab("Observed", systemImage: "eye", value: .observed) {
                ObservedObjectView(model: timerModel)
            }
            
            Tab("Published", systemImage: "sparkles", value: .published) {
                PublishedView()
            }
            
            Tab("SceneStorage", systemImage: "doc.richtext", value: .sceneStorage) {
                SceneStorageView()
            }
            
            Tab("Namespace", systemImage: "rectangle.3.group", value: .namespace) {
                NamespaceView()
            }
            
            Tab("Gesture", systemImage: "hand.draw", value: .gestureState) {
                GestureStateView()
            }
            // Continue for each tab with unique `value`
        }
    }
}

#Preview {
    ContentView()
}
