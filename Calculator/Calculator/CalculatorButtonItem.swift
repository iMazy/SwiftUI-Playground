//
//  CalculatorButtonItem.swift
//  Calculator
//
//  Created by Admin on 2022/6/18.
//

import Foundation
import UIKit
import SwiftUI

enum CalculatorButtonItem: Hashable {
    
    enum Op: String {
        case plus     = "+"
        case minus    = "-"
        case divide   = "÷"
        case multiply = "×"
        case equal    = "="
    }
    
    enum Command: String {
        case clear   = "AC"
        case flip    = "+/-"
        case percent = "%"
    }
    
    case digit(Int)
    case dot
    case op(Op)
    case command(Command)
}

extension CalculatorButtonItem {
    
    var title: String {
        switch self {
        case .digit(let value):
            return String(value)
        case .dot:
            return "."
        case .op(let op):
            return op.rawValue
        case .command(let command):
            return command.rawValue
        }
    }
    
    var size: CGSize {
        let sizeWH = (UIScreen.main.bounds.width - 50) / 4
        if case .digit(let value) = self, value == 0 {
            return CGSize(width: sizeWH * 2 + 10, height: sizeWH)
        }
        return CGSize(width: sizeWH, height: sizeWH)
    }
    
    var bgColor: Color {
        switch self {
        case .digit, .dot:
            return Color.black
        case .op:
            return Color.orange
        case .command:
            return Color.gray
        }
    }
}

extension CalculatorButtonItem.Op {
    
    func calculate(l: String, r: String) -> String? {
   
        guard let left = Double(l), let right = Double(r) else {
            return nil
        }
        
        let result: Double?
        switch self {
        case .plus:
            result = left + right
        case .minus:
            result = left - right
        case .multiply:
            result = left * right
        case .divide:
            result = right == 0 ? nil : left / right
        case .equal:
            fatalError()
        }
    
        return result.map({ String($0) })
    }
}

extension CalculatorButtonItem: CustomStringConvertible {
    var description: String {
        switch self {
        case .digit(let num):
            return String(num)
        case .dot:
            return "."
        case .op(let op):
            return op.rawValue
        case .command(let cmd):
            return cmd.rawValue
        }
    }
}

