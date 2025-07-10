//
//  GestureStateView.swift
//  SwiftUIPropertyWrapperDemo
//
//  Created by Ruchika Bokadia on 2025-07-09.
//
import SwiftUI

struct GestureStateView: View {
    @GestureState private var dragOffset = CGSize.zero
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Dragging Offset:")
            Text("x: \(Int(dragOffset.width)), y: \(Int(dragOffset.height))")
                .font(.headline)
            
            RoundedRectangle(cornerRadius: 16)
                .fill(.blue)
                .frame(width: 120, height: 120)
                .offset(dragOffset)
                .gesture(
                    DragGesture()
                        .updating($dragOffset) { value, state, _ in
                            state = value.translation
                        }
                )
        }
        .padding(.top, 100)
    }
}

#Preview {
    GestureStateView()
}

// Notes: 🟡 @GestureState – Track Gesture Progress in Real-Time

// @GestureState lets you track values during a gesture (like dragging), then resets automatically when the gesture ends.
//Perfect for effects that shouldn’t persist
// 🔹@GestureState gives live gesture data only while you're dragging
// 🔹The object returns to default as soon as the gesture ends
// 🔹Great for showing temporary progress like swipes, slides, or scrubs
// @GestureState → temporary (resets after gesture ends)

// @State → persistent (retains value after gesture ends)

