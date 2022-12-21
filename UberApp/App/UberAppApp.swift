//
//  UberAppApp.swift
//  UberApp
//
//  Created by Aleksandr Shapovalov on 20/12/22.
//

import SwiftUI

@main
struct UberAppApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
