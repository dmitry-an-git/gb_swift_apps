//
//  swiftUItestApp.swift
//  swiftUItest
//
//  Created by Dmitry An on 02/12/2023.
//

import SwiftUI

@main
struct swiftUItestApp: App {
    var body: some Scene {
        WindowGroup {
            //ContentView()
            NewContentView(color: ObservableColor())
        }
    }
}
