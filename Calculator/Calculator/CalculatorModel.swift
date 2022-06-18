//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Admin on 2022/6/18.
//

import Foundation
import Combine

class CalculatorModel: ObservableObject {
    
    @Published var brain: CalculatorBrain = .left("0")
    @Published var history: [CalculatorButtonItem] = []
    
    var historyDetail: String {
        history.map({ $0.description }).joined()
    }
    
    var temporyKept: [CalculatorButtonItem] = []
    
    var totalCount: Int {
        history.count + temporyKept.count
    }
    
    var slidingIndex: Float = 0 {
        didSet {
            keepHistory(upTo: Int(slidingIndex))
        }
    }
    
    func keepHistory(upTo index: Int) {
        precondition(index <= totalCount, "Out of index")
        let total = history + temporyKept
        history = Array(total[..<index])
        temporyKept = Array(total[index...])
        brain = history.reduce(CalculatorBrain.left("0")) { result, item in
            result.apply(item: item)
        }
    }
    
    func apply(_ item: CalculatorButtonItem) {
        brain = brain.apply(item: item)
        history.append(item)
        
        temporyKept.removeAll()
        slidingIndex = Float(totalCount)
    }
}
