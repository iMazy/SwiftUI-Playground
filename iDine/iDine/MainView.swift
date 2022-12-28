//
//  MainView.swift
//  iDine
//
//  Created by Ma on 2022/12/28.
//

import SwiftUI

struct MainView: View {

    @StateObject var order = Order()

    var body: some View {
        TabView {
            ContentView()
                .environmentObject(order)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            
            OrderView()
                .environmentObject(order)
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Order())
    }
}
