//
//  ContentView.swift
//  testButtonObservable
//
//  Created by Dmitry An on 03/12/2023.
//

import SwiftUI

class Counter: ObservableObject {
    @Published var counter = 10000
}


struct ContentView: View {
    @ObservedObject var counter = Counter()
    
    var body: some View {
        VStack {
            Text("Hello, world!")
            Text("\(counter.counter)").font(.system(size: 32, weight: .semibold))
            Button("increase counter") {
                counter.counter += 1
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
