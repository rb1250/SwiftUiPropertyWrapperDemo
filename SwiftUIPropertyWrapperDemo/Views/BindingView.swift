//
//  BindingView.swift
//  SwiftUIPropertyWrapperDemo
//
//  Created by Ruchika Bokadia on 2025-07-09.
//

import SwiftUI

struct BindingView: View {
    @Binding var isOn: Bool
    var body: some View {
        Toggle(isOn: $isOn) {
            Text("Toggle")
                .font(.title2)
                .padding()
        }
        .padding()
    }
}

#Preview {
    BindingView(isOn: .constant(true))
}

// Notes: @Binding doesn’t store the data — it reflects and modifies the real value in the parent.
