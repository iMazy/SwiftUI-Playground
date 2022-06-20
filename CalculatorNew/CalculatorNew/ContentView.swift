//
//  ContentView.swift
//  CalculatorNew
//
//  Created by Mazy on 2022/6/20.
//

import SwiftUI

enum CalculatorButton: String {
    
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case mutliply = "x"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "-/+"

    var buttonColor: Color {
        switch self {
        case .add, .subtract, .mutliply, .divide, .equal:
            return .orange
        case .clear, .negative, .percent:
            return Color(.lightGray)
        default:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        }
    }
    
    var buttonWidth: CGFloat {
        let itemWidth = (UIScreen.main.bounds.width - (5 * 12)) / 4
        if self == .zero {
            return itemWidth * 2 + 12
        } else {
            return itemWidth
        }
    }
    
    var buttonHeight: CGFloat {
        let itemHeight = (UIScreen.main.bounds.width - (5 * 12)) / 4
        return itemHeight
    }
}

enum Operation {
    case add, subtract, multiply, divide, none
}

struct ContentView: View {
    
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operation = .none
    
    let buttons: [[CalculatorButton]] = [
          [.clear, .negative, .percent, .divide],
          [.seven, .eight, .nine, .mutliply],
          [.four, .five, .six, .subtract],
          [.one, .two, .three, .add],
          [.zero, .decimal, .equal],
      ]
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            Spacer()
            HStack {
                Spacer()
                Text(value)
                    .font(.system(size: 60))
                    .foregroundColor(.white)
            }
            .padding()
            
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self) { item in
                        Button {
                            didTapButton(item)
                        } label: {
                            Text(item.rawValue)
                                .font(.system(size: 32))
                                .frame(width: item.buttonWidth, height: item.buttonHeight)
                                .background(item.buttonColor)
                                .foregroundColor(.white)
                                .cornerRadius(item.buttonHeight / 2)
                        }
                    }
                }
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
    
    func didTapButton(_ button: CalculatorButton) {
        switch button {
        case .add:
            self.currentOperation = .add
            self.runningNumber = Int(value) ?? 0
        case .subtract:
            self.currentOperation = .subtract
            self.runningNumber = Int(value) ?? 0
        case .divide:
            self.currentOperation = .divide
            self.runningNumber = Int(value) ?? 0
        case .mutliply:
            self.currentOperation = .multiply
            self.runningNumber = Int(value) ?? 0
        case .equal:
            calculatorAction()
        case .clear: // AC
            value = "0"
            runningNumber = 0
            currentOperation = .none
        case .decimal: // 小数点
            break
        case .percent: // %
            break
        case .negative: // -/+
            break
        default: // 0-9
            let num = button.rawValue
            if self.value == "0" {
                value = num
                runningNumber = 0
            } else {
                if self.currentOperation == .none {
                    value = "\(value)\(num)"
                    runningNumber = Int(value) ?? 0
                } else {
                    calculatorAction()
                    currentOperation = .none
                }
            }
        }
    }
    
    func calculatorAction() {
        let runningValue = runningNumber
        let currentValue = Int(value) ?? 0
        switch self.currentOperation {
        case .add:
            value = "\(currentValue + runningValue)"
        case .subtract:
            value = "\(currentValue - runningValue)"
        case .multiply:
            value = "\(currentValue * runningValue)"
        case .divide:
            value = "\(currentValue / runningValue)"
        case .none:
            break
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
