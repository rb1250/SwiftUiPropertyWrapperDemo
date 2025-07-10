//
//  NamespaceView.swift
//  SwiftUIPropertyWrapperDemo
//
//  Created by Ruchika Bokadia on 2025-07-09.
//
import SwiftUI

struct NamespaceView: View {
    @Namespace private var animation
    @State private var isExpanded = false
    
    var body: some View {
        VStack {
            if isExpanded {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.pink)
                    .matchedGeometryEffect(id: "shape", in: animation)
                    .frame(width: 250, height: 180)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            isExpanded.toggle()
                        }
                    }
            } else {
                Circle()
                    .fill(Color.pink)
                    .matchedGeometryEffect(id: "shape", in: animation)
                    .frame(width: 100, height: 100)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            isExpanded.toggle()
                        }
                    }
            }
            
            Spacer()
        }
        .padding(.top, 100)
        .animation(.spring(), value: isExpanded)
    }
}

#Preview {
    NamespaceView()
}

// Notes: @Namespace — Shared Animation Space


//🪄 How It Works:
//Both views share the same matchedGeometryEffect ID

//When toggled, SwiftUI animates the shape, size, and position

//The @Namespace acts as a bridge between them

//@Namespace allows views to share animation identity for smooth transitions between matching elements.
                                                            
// 🎯 Use Cases:
// Animated transitions between views

// Hero image animation from list to detail

// Tab or button morphing animations

