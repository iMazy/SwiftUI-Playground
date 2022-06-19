//
//  ContentView.swift
//  Landmarks
//
//  Created by Admin on 2022/6/18.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Tab = .fatured
    
    enum Tab {
        case fatured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Feature", systemImage: "star")
                }
                .tag(Tab.fatured)
            
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
