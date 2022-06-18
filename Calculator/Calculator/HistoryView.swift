//
//  HistoryView.swift
//  Calculator
//
//  Created by Admin on 2022/6/18.
//

import Foundation
import SwiftUI

struct HistoryView: View {
    
    @ObservedObject var model: CalculatorModel
    
    var body: some View {
        VStack {
            if model.totalCount == 0 {
                Text("No History Yet")
            } else {
                HStack {
                    Text("History")
                        .font(.headline)
                    Text("\(model.historyDetail)")
                        .lineLimit(0)
                }
                HStack {
                    Text("Shown").font(.headline)
                    Text("\(model.brain.output)")
                }
                Slider(value: $model.slidingIndex, in: 0...Float(model.totalCount), step: 1)
            }
        }.padding()
    }
}
