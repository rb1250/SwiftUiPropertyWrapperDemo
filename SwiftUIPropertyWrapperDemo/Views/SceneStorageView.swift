//
//  SceneStorageView.swift
//  SwiftUIPropertyWrapperDemo
//
//  Created by Ruchika Bokadia on 2025-07-09.
//
import SwiftUI

struct SceneStorageView: View {
    @SceneStorage("note") private var note = ""
    @State private var isTyping = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Write something...")
                    .font(.title2)
                    .bold()
                
                if isTyping {
                    Text("✍️")
                        .transition(.scale)
                        .animation(.easeInOut(duration: 0.3), value: isTyping)
                }
            }
            
            TextEditor(text: $note)
                .padding()
                .frame(minHeight: 250)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                .padding(.horizontal)
                .onChange(of: note, { oldValue, newValue in
                    withAnimation {
                        isTyping = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        withAnimation {
                            isTyping = false
                        }
                    }
                })
        }
        .padding()
    }
}

#Preview {
    SceneStorageView()
}

// Notes: @SceneStorage saves view state tied to the current scene and automatically restores it when the scene reappears.

//🎯 Use Cases:
//Drafted text in a form
//
//Selected tabs
//
//Toggle or slider values
//
//Scroll position
//
//Unlike @AppStorage, it’s not truly permanent — it’s tied to scene lifecycle.
