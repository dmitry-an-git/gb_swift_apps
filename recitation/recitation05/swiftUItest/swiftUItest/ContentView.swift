//
//  ContentView.swift
//  swiftUItest
//
//  Created by Dmitry An on 02/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Разноцветные квадраты")
            HStack {
                RectangleColumn()
                RectangleColumn()
                RectangleColumn()
            }
            Text("Разноцветные круги")
            HStack {
                CircleColumn()
                CircleColumn()
                CircleColumn()
            }
            Text("Разноцветные квадраты со скругленными краями")
                .multilineTextAlignment(.center)
            HStack {
                RoundedRectangleColumn()
                RoundedRectangleColumn()
                RoundedRectangleColumn()
            }
        }
        .padding()
    }
}

struct RectangleColumn: View {
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 50, height: 50)
                .foregroundColor(.red)
            Rectangle()
                .frame(width: 50, height: 50)
                .foregroundColor(.yellow)
            Rectangle()
                .frame(width: 50, height: 50)
                .foregroundColor(.green)
        }
    }
}

struct RoundedRectangleColumn: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 3)
                .frame(width: 50, height: 50)
                .foregroundColor(.red)
            RoundedRectangle(cornerRadius: 3)
                .frame(width: 50, height: 50)
                .foregroundColor(.yellow)
            RoundedRectangle(cornerRadius: 3)
                .frame(width: 50, height: 50)
                .foregroundColor(.green)
        }
    }
}

struct CircleColumn: View {
    var body: some View {
        VStack {
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(.red)
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(.yellow)
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(.green)
        }
    }
}

#Preview {
    ContentView()
}
