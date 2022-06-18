//
//  ImageTutorial.swift
//  SwiftUIBase
//
//  Created by Admin on 2022/6/18.
//

import SwiftUI

struct ImageTutorial: View {
    var body: some View {
        imageScale
    }
    
    /// MARK: - 1.Intro
    var intro: some View {
        VStack {
            Text("A view that displays an environment-dependent image.")
                .multilineTextAlignment(.center)
        }
    }
    
    /// MARK: - 2. Basic Use
    var basicUsage: some View {
        Image("dog")
            .resizable()
        //                .aspectRatio(contentMode: .fit)
            .scaledToFit()
    }
    
    /// MARK: - 3. Bundle
    var initWithBundle: some View {
//        Group {
//            if let resBundlePath = Bundle.main.path(forResource: "Resources", ofType: "bundle"), let resBundle = Bundle(path: resBundlePath) {
//                Image("sky.jpg", bundle: resBundle)
//                    .resizable()
//                    .scaledToFit()
//            } else {
//                Color.red
//            }
//        }
//        Group {
//            if let resBundlePath = Bundle.main.path(forResource: "Resources", ofType: "bundle"),
//               let resBundle = Bundle(path: resBundlePath),
//            let uiImage = UIImage(named: "sky.jpg", in: resBundle, with: nil)
//            {
//                Image(uiImage: uiImage)
//                    .resizable()
//                    .scaledToFit()
//            } else {
//                Color.red
//            }
//        }
        
        VStack { () -> AnyView in
            guard let resBundlePath = Bundle.main.path(forResource: "Resources", ofType: "bundle"),
                   let resBundle = Bundle(path: resBundlePath),
                  let uiImage = UIImage(named: "sky.jpg", in: resBundle, with: nil) else {
                return AnyView(Color.red)
            }
            return AnyView(Image(uiImage: uiImage).resizable().scaledToFit())
        }

    }
    
    /// MARK: - 4. Icon
    var initWithIcon: some View {
        VStack(spacing: 10) {
            Image(systemName: "mic.circle.fill")
                .resizable()
                .font(.body)
                .frame(width: 50, height: 50, alignment: .center)
            
            HStack(spacing: 0) {
                HStack {
                    Text("123")
                    Image(systemName: "mic.circle.fill")
                    Text("456")
                }
                .font(Font.system(size: 34, weight: .bold))
            }
            
            Image(systemName: "figure.walk.circle.fill")
                .resizable()
                .font(.body)
                .frame(width: 50, height: 50, alignment: .center)
                .foregroundColor(.red)
        }
    }
    
    /// MARK: - 5. Resize
    var resize: some View {
        VStack {
//            Image("dog")
//                .resizable(resizingMode: .stretch)
////                .resizable(resizingMode: .tile)
////                .scaledToFit()
//                .edgesIgnoringSafeArea(.all)
            
//            Image("dog")
////                .resizable()
//                .resizable(capInsets: .init(top: 10, leading: 10, bottom: 10, trailing: 10), resizingMode: .stretch)
            
            Image("dog")
                .interpolation(.none)
                .antialiased(true)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
                .clipped()
            
        }
    }
    
    /// MARK: - 6. Render Mode
    var renderMode: some View {
        TabView {
            Text("1")
                .tabItem {
                    Image(systemName: "purchased.circle")
                        .renderingMode(.template)
                }
            Text("2")
                .tabItem {
                    Image(systemName: "purchased.circle")
                        .renderingMode(.original)
                }
            Text("3")
                .tabItem {
                    Image(systemName: "purchased.circle")
                        .renderingMode(.original)
                }
        }
    }
    
    /// MARK: - 7. Remote Image
    var remoteImage: some View {
        AsyncImage(url: URL(string: "https://picsum.photos/id/237/200/300"))
            .scaledToFit()
            .frame(width: 200, height: 200, alignment: .center)
            .clipped()
    }
    
    /// MARK: - 8.  Image scale
    var imageScale: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Image(systemName: "beats.fit.pro.chargingcase.fill")
                    .imageScale(.small)
                Text("small")
            }
            HStack {
                Image(systemName: "beats.fit.pro.chargingcase.fill")
                    .imageScale(.medium)
                Text("medium")
            }
            HStack {
                Image(systemName: "beats.fit.pro.chargingcase.fill")
                    .imageScale(.large)
                Text("large")
            }
        }
    }
}

struct ImageTutorial_Previews: PreviewProvider {
    static var previews: some View {
        ImageTutorial()
    }
}
