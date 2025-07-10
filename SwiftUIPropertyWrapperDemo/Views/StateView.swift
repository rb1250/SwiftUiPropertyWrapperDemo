//
//  StateView.swift
//  SwiftUIPropertyWrapperDemo
//
//  Created by Ruchika Bokadia on 2025-07-09.
//

import SwiftUI

struct StateView: View {
    @State private var count = 0
    
    var body: some View {
        VStack {
            Text("Count: \(count)")
                .font(.title)
            Button("Increment") {
                count += 1
            }
        }
    }
}

#Preview {
    StateView()
}

//Notes : ✅ @State stores view-local value-type data and automatically triggers a UI update when changed.
