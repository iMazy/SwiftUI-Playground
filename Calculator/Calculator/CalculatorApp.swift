//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Admin on 2022/6/17.
//

import SwiftUI

@main
struct CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(CalculatorModel())
        }
    }
}
