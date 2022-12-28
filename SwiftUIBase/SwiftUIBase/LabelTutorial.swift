//
//  LabelTutorial.swift
//  SwiftUIBase
//
//  Created by Ma on 2022/12/28.
//

import SwiftUI

struct LabelTutorial: View {
    
    var body: some View {
        
        VStack {
            Label("Your account", systemImage: "folder.circle")
//            Label("Welcome", image: "dog")
            
            Label("Text Only", systemImage: "heart")
                    .font(.title)
                    .labelStyle(.titleOnly)
            
            Label("Icon Only", systemImage: "star")
                    .font(.title)
                    .labelStyle(.iconOnly)
            
            Label("Both", systemImage: "paperplane")
                    .font(.title)
                    .labelStyle(.automatic)
            
            Label {
                Text("Hello World!")
                    .foregroundColor(.primary)
                    .font(.largeTitle)
                    .padding()
                    .background(.gray.opacity(0.4))
                    .clipShape(Capsule())
            } icon: {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.blue)
                    .frame(width: 64, height: 64)
            }

        }
    }
}

struct LabelTutorial_Previews: PreviewProvider {
    static var previews: some View {
        LabelTutorial()
    }
}
