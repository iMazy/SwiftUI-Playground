//
//  TextFieldTutorial.swift
//  SwiftUIBase
//
//  Created by Admin on 2022/6/18.
//

import SwiftUI

struct TextFieldTutorial: View {
    var body: some View {
        basicUsage
    }
    
    
    /// MARK: - Basic Use
    @State private var email: String = ""
    @State private var isEidting: Bool = false
    
    var basicUsage: some View {
        VStack(spacing: 30) {
            TextField("Input your email adress", text: $email) { isEidting in
                self.isEidting = isEidting
            } onCommit: {
                print("Your emial adress is: \(email)")
            }
            .autocapitalization(.none)
            .padding()
            .border(tipsBorder)
            HStack {
                Text("Your emial is: \(email)")
                Spacer()
            }
            Spacer()
        }
        .padding()
        .background(Color.clear.onTapGesture {
            print("tap action click...")
        })
    }
    
    var tipsBorder: some ShapeStyle {
        if isEidting {
            return validate(email) ? Color.green : Color.red
        } else {
            return Color.gray
        }
    }
    
    private func validate(_ email: String) -> Bool {
        return isValid(email: email)
    }
    
    private func isValid(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z._]+\\.[A-Za-z]{2,6}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return predicate.evaluate(with: email)
    }
    
    /// MARK: - Formatter
    @State private var nameComponents = PersonNameComponents()
    let nameFormatter = PersonNameComponentsFormatter()
    var formatterTextField: some View {
        VStack {
            TextField("Proper name", value: $nameComponents, formatter: nameFormatter) {
                display(components: nameComponents)
            }
            .padding()
            .disableAutocorrection(true)
            .border(Color.gray)
            Text(nameComponents.debugDescription)
        }
        .padding()
    }
    
    private func display(components: PersonNameComponents) {
        print("components is: \(components)")
    }
    
    // MARK: - Modifiers
    var modifiers: some View {
        TextField("Input your email address", text: $email)
            .textContentType(.emailAddress)
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
            .disableAutocorrection(false)
            .textCase(.none)
            .accentColor(.green)
            .padding()
            .border(Color.gray)
    }
    
    // MARK: - Style TextField
    @State private var givenName: String = ""
    @State private var familyName: String = ""
    
    var styleTextField: some View {
        VStack {
            VStack {
                TextField("Given Name", text: $givenName)
                TextField("Family Name", text: $familyName)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            VStack {
                TextField("Given Name", text: $givenName)
                TextField("Family Name", text: $familyName)
            }
            .textFieldStyle(PlainTextFieldStyle())
            
            VStack {
                TextField("Given Name", text: $givenName)
                TextField("Family Name", text: $familyName)
            }
            .textFieldStyle(DefaultTextFieldStyle())
            
        }.padding()
    }

}


struct TextFieldTutorial_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldTutorial()
    }
}
