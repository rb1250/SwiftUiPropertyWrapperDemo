//
//  ObservedObjectView.swift
//  SwiftUIPropertyWrapperDemo
//
//  Created by Ruchika Bokadia on 2025-07-09.
//
import SwiftUI

struct ObservedObjectView: View {
    @ObservedObject var model: TimerModel
    
    var body: some View {
        VStack {
            Text("Time: \(model.time)")
                .font(.largeTitle)
        }
        .padding()
        .onAppear {
            model.start()
        }
        .onDisappear {
            model.stop()
        }
    }
}

#Preview {
    ObservedObjectView(model: TimerModel())
}
