//
//  TurdGoApp.swift
//  TurdGo
//
//  Created by Kelly Bian on 6/12/23.
//

import SwiftUI

@main
struct TurdGoApp: App {
    @StateObject var locationViewModel = LocationSearchModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationViewModel)
        }
    }
}
