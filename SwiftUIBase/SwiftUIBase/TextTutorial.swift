//
//  TextTutorial.swift
//  SwiftUIBase
//
//  Created by Admin on 2022/6/18.
//

import SwiftUI

struct TextTutorial: View {
    var body: some View {
        linksText
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
    
    /// Text with AttributedString
    var attributedText: some View {
        var message: AttributedString {
            var result = AttributedString("Hello, world!")
            result.font = .largeTitle
            result.foregroundColor = .white
            result.backgroundColor = .red
            return result
        }
        
        var underlineMessage: AttributedString {
            var result = AttributedString("Testing")
            result.font = .largeTitle
            result.foregroundColor = .white
            result.backgroundColor = .blue
            result.underlineStyle = Text.LineStyle(pattern: .solid, color: .white)
            return result
        }
        
        var message1: AttributedString {
            let string = "The letters go up and down"
            var result = AttributedString()
            
            for (index, letter) in string.enumerated() {
                var letterString = AttributedString(String(letter))
                letterString.baselineOffset = sin(Double(index)) * 5
                result += letterString
            }
            
            result.font = .largeTitle
            return result
        }
        
        var linkMessage: AttributedString {
            var result = AttributedString("Learn Swift here")
            result.font = .largeTitle
            result.link = URL(string: "https://www.hackingwithswift.com")
            return result
        }
        
        var passwordMessage: AttributedString {
            var password = AttributedString("abCayer-muQai")
            password.accessibilitySpeechSpellsOutCharacters = true
            return "Your password is: " + password
        }
        
        var dayMessage: AttributedString {
             var result = Date.now.formatted(.dateTime.weekday(.wide).day().month(.wide).attributed)
             result.foregroundColor = .secondary

             let weekday = AttributeContainer.dateField(.weekday)
             let weekdayStyling = AttributeContainer.foregroundColor(.primary)
             result.replaceAttributes(weekday, with: weekdayStyling)

             return result
         }
        
        var personNameMessage: AttributedString {
            var components = PersonNameComponents()
            components.givenName = "Taylor"
            components.familyName = "Swift"
            
            var result = components.formatted(.name(style: .long).attributed)
            
            let familyNameStyling = AttributeContainer.font(.headline)
            let familyName = AttributeContainer.personNameComponent(.familyName)
            result.replaceAttributes(familyName, with: familyNameStyling)
            
            return result
        }

        var kilometersMessage: AttributedString {
            var amount = Measurement(value: 200, unit: UnitLength.kilometers)
            var result = amount.formatted(.measurement(width: .wide).attributed)
            
            let distanceStyling = AttributeContainer.font(.title)
            let distance = AttributeContainer.measurement(.value)
            result.replaceAttributes(distance, with: distanceStyling)
            
            return result
        }
        
        return VStack(spacing: 10) {
            Text(message + underlineMessage)
            Text(message1)
            Text(passwordMessage)
            Text(dayMessage)
            Text(personNameMessage)
            
            Text(kilometersMessage)
            
            Text("This is placeholder text")
                .font(.title)
                .redacted(reason: .placeholder)
            
            VStack {
                Text("This Placeholder text")
                Text("And so is this")
            }
            .font(.title)
            .redacted(reason: .placeholder)
        }
    }
    
    var markdownText: some View {
        VStack {
            Text("This is regular text.")
            Text("* This is **bold** text, this is *italic* text, and this is ***bold, italic*** text.")
            Text("~~A strikethrough example~~")
            Text("`Monospaced works too`")
            Text("Visit Apple: [click here](https://apple.com)")

        }
        .padding(5)
    }
    
    var linksText: some View {
        VStack {
            Link("Visit Apple Link", destination: URL(string: "https://apple.com")!)
                .padding()
            Text("[Visit Apple](https://apple.com)")
                .tint(.indigo)
        }
        .environment(\.openURL, OpenURLAction(handler: handleURL))
    }
    
    func handleURL(_ url: URL) -> OpenURLAction.Result {
        print("Handle \(url) somehow")
        return .handled
    }
}

struct TextTutorial_Previews: PreviewProvider {
    static var previews: some View {
        TextTutorial()
    }
}
