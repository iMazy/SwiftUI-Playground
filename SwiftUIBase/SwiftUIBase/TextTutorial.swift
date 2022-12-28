//
//  TextTutorial.swift
//  SwiftUIBase
//
//  Created by Admin on 2022/6/18.
//

import SwiftUI

struct TextTutorial: View {
    var body: some View {
        localizedStr
    }
    
    /// MARK: - Intro
    var intro: some View {
        return Text("TextTutorial")
    }
    
    /// MARK: - Basic
    var basic: some View {
        
        VStack {
            Text("Hello World")
            Text("Hello World")
                .foregroundColor(.red)
            Text("Hello World")
                .font(.title)
            Text("Hello World")
                .font(.title)
                .italic()
                .bold()
            
        }
    }
    
    /// MARK: - CustomFont
    var customFont: some View {
        VStack {
            Text("Hello World")
                .font(.system(size: 30, weight: .light, design: .serif))
            Text("Hello World")
                .font(.system(size: 30, weight: .bold, design: .monospaced))
            Text("Hello World")
                .font(.custom("Font-name", size: 30))
        }
    }
    
    /// MARK: - TextFix
    @State private var myTextFiled = ""
    var textFit: some View {
        VStack {
            Text("Talk is cheep, show me your code.")
                .frame(width: 100)
            Text("Talk is cheep, show me your code.")
                .frame(width: 100)
                .lineLimit(1)
            Text("This is a wide text element")
                .font(.body)
                .frame(width: 200, height: 50, alignment: .leading)
                .lineLimit(1)
                .allowsTightening(true)
            Text("This is a wide text element")
                .font(.body)
                .frame(width: 200, height: 50, alignment: .leading)
                .lineLimit(1)
                .allowsTightening(false)
            
            HStack {
                Text("This is a long label that will be scaled to fit:")
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                TextField("My Long Text Field", text: $myTextFiled)
            }.padding(.horizontal, 15)

            VStack {
                Text("This is a block of text that will show up in a text element as multiple lines. The text will fill the available space, and then, eventually, be truncated.")
                    .frame(width: 150, height: 150)
                    .truncationMode(.tail)
                Text("This is a block of text that will show up in a text element as multiple lines. The text will fill the available space, and then, eventually, be truncated.")
                    .frame(width: 150, height: 150)
                    .truncationMode(.head)
                Text("This is a block of text that will show up in a text element as multiple lines. The text will fill the available space, and then, eventually, be truncated.")
                    .frame(width: 150, height: 150)
                    .truncationMode(.middle)
            }
        }
    }
    
    /// MARK: - Format Display
    let price = 99.80
    let startDate = Date(timeIntervalSinceNow: -3600)
    var formatDisplay: some View {
        VStack {
            Text("$\(price, specifier: "%.2f")")
            Text(startDate, style: .time)
            Text(startDate, style: .date)
            Text(startDate, style: .relative)
            Text(startDate, style: .offset)
            Text(startDate, style: .timer)
            Text(startDate...Date())
            Text(DateInterval(start: startDate, duration: 300))
        }
    }
    
    /// MARK: - Other Style
    var otherStyle: some View {
        VStack {
            Text("Hello World")
                .font(.largeTitle)
                .strikethrough(true, color: .red)
            Text("Hello World")
                .font(.largeTitle)
                .underline(true, color: .green)
            
            HStack(alignment: .center) {
                Text("Hello")
                Text("Hello")
                    .baselineOffset(-10)
                    .border(Color.red)
                Text("Hello")
                    .border(Color.green)
                Text("Hello")
                    .baselineOffset(10)
                    .border(Color.blue)
            }
            .background(Color(white: 0.9))
            Text("Hello World")
                .textCase(.uppercase)
            Text("Hello World")
                .textCase(.lowercase)
            Text("This is a string in a textField with 10 point spacing applied between the bottom if one line and the top of the next.")
                .frame(width: 200, height: 200, alignment: .leading)
                .lineSpacing(10)
                .background(Color.red)
            Text("This is a block of text that will show up in a text element as multiple lines. \("\n") Here we hace chosen ti center this text.")
                .frame(width: 200, height: 200, alignment: .leading)
                .multilineTextAlignment(.center)
            Text("Hello World")
                .flipsForRightToLeftLayoutDirection(true)
                .environment(\.layoutDirection, .rightToLeft)
        }
    }
    
    /// MARK: - Combine Text
    var combineText: some View {
        Text("Hello")
            .foregroundColor(Color.red)
            .font(.title)
        +
        Text("World")
            .foregroundColor(.green)
            .font(.title)
            .italic()
    }
    
    /// MARK: - Localized
    var localizedStr: some View {
        VStack {
            Text("365")
                .tracking(1)
            Text(verbatim: "pencil")
                .kerning(1)
            Text(LocalizedStringKey("pencil"))
        }
    }
}

struct TextTutorial_Previews: PreviewProvider {
    static var previews: some View {
        TextTutorial()
    }
}
