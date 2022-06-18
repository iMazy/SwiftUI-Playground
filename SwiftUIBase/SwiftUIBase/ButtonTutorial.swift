//
//  ButtonTutorial.swift
//  SwiftUIBase
//
//  Created by Admin on 2022/6/18.
//

import SwiftUI

struct ButtonTutorial: View {
    var body: some View {
        customButtonStyle
    }
    
    var intro: some View {
        VStack(spacing: 20) {
            Text("Button")
            Text("可以响应用户操作的基础控件")
        }
        .font(.title2)
    }
    
    var baseUsage: some View {
        VStack(spacing: 20) {
            HStack {
                Button(action: {
                    signIn()
                }, label: {
                    Text("Sign in 1")
                })
                Button(action: signIn) {
                    Text("Sign in 2")
                }
            }
            HStack {
                Button("Rigister 1") {
                    register()
                }
                Button("Rigister 2", action: register)
            }
        }
    }
    
    private func signIn() {
        print("Sign In")
    }
    
    private func register() {
        print("register")
    }
    
    var addToContainers: some View {
        VStack {
            List {
                ForEach(items) { item in
                    Text(item.title)
                }
                Button("Add Item", action: addItem)
            }
        }
    }
    
    struct Item: Identifiable {
        let id = UUID()
        let title: String
        let desc: String
    }
    
    @State private var items: [Item] = []
    
    private func addItem() {
        let newItem = Item(title: "new item title", desc: "new item desc")
        items.append(newItem)
    }
    
    // MARK: - Button Style
    var styleButtoniOS: some View {
        VStack(spacing: 20) {
            Button("Sign In", action: signIn)
                .buttonStyle(PlainButtonStyle())
            Button("Sign In", action: signIn)
                .buttonStyle(BorderedButtonStyle())
            Button("Sign In", action: signIn)
                .buttonStyle(BorderlessButtonStyle())
            Button("Sign In", action: signIn)
                .buttonStyle(DefaultButtonStyle())
        }
    }
    
    var customButtonStyle: some View {
        VStack(spacing: 20) {
            Button("Scale Effect", action: signIn)
                .buttonStyle(ScaleEffectButtonStyle())
            Button("Red Bordered", action: signIn)
                .buttonStyle(RedBorderedButtonStyle())
            Button("Bordered + Scale Effect", action: signIn)
                .buttonStyle(RedBorderedButtonStyle())
                .buttonStyle(ScaleEffectButtonStyle())
            Button("Scale Effect + Bordered", action: signIn)
                .buttonStyle(ScaleEffectButtonStyle())
                .buttonStyle(RedBorderedButtonStyle())
            Button("Long Press", action: signIn)
                .buttonStyle(LongPressButtonStyle())
            Button("Long Press + Bordered + Scale Effect", action: signIn)
                .buttonStyle(CustomButtonStyle())
        }
    }
    
    struct ScaleEffectButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            HStack {
                Spacer()
                configuration.label
                    .padding()
                    .foregroundColor(configuration.isPressed ? .red : .white)
                Spacer()
            }
            .frame(width: 300)
            .background(Color.blue.cornerRadius(10))
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
        }
    }
 
    struct RedBorderedButtonStyle: PrimitiveButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            Button(configuration)
                .border(Color.red, width: 2)
        }
    }
    
    struct LongPressButtonStyle: PrimitiveButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            Button(configuration)
                .gesture(
                    LongPressGesture()
                        .onEnded({ _ in
                            configuration.trigger()
                        })
                )
        }
    }
    
    struct CustomButtonStyle: PrimitiveButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            Button(configuration)
                .buttonStyle(LongPressButtonStyle())
                .buttonStyle(RedBorderedButtonStyle())
                .buttonStyle(ScaleEffectButtonStyle())
        }
    }
}

struct ButtonTutorial_Previews: PreviewProvider {
    static var previews: some View {
        ButtonTutorial()
    }
}
