//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Admin on 2022/6/18.
//

import SwiftUI

@main
struct LandmarksApp: App {
    
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
