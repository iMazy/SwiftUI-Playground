//
//  ContentView.swift
//  iDine
//
//  Created by Ma on 2022/12/28.
//

import SwiftUI

struct ContentView: View {
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")

    var body: some View {
        NavigationStack {
            List { // 列表
                ForEach(menu) { section in // 元素
                    Section(header: Text(section.name)) { // section
                        ForEach(section.items) { item in
                            NavigationLink(value: item) {
                                ItemRow(item: item) // row
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: MenuItem.self) { item in
                ItemDetail(item: item)
            }
            .navigationTitle("Menu")
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
