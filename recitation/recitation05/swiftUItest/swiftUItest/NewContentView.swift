//
//  NewContentView.swift
//  swiftUItest
//
//  Created by Dmitry An on 02/12/2023.
//

import SwiftUI

struct NewContentView: View {
    @StateObject var color: ObservableColor
    
    var body: some View {
        VStack {
            Text("Светофор")
            TrafficLightRectangle(section: color)
            Button("Сменить цвет") {
                switch color.color {
                case .red: color.color = .yellow
                case .yellow: color.color = .green
                case .green: color.color = .red
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
        }
        .padding()
    }
}

class ObservableColor: ObservableObject {
    @Published var color: TrafficLight = .red
}

enum TrafficLight{
    case red, yellow, green
}

struct TrafficLightRectangle: View {
    @ObservedObject var section = ObservableColor()
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 50, height: 50)
                .border(Color.red)
                .foregroundColor(section.color == .red ? .red : .white)
            Rectangle()
                .frame(width: 50, height: 50)
                .border(Color.yellow)
                .foregroundColor(section.color == .yellow ? .yellow : .white)
            Rectangle()
                .frame(width: 50, height: 50)
                .border(Color.green)
                .foregroundColor(section.color == .green ? .green : .white)
        }
    }
}

#Preview {
    NewContentView(color: ObservableColor())
}
