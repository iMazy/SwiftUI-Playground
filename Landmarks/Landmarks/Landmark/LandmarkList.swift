//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Admin on 2022/6/18.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly) || landmark.isFavorite
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
                .listRowSeparator(.hidden)
//                .listRowInsets(EdgeInsets())
            }
            .listStyle(PlainListStyle())
            .navigationTitle(Text("Landmarks"))
        }
        .ignoresSafeArea(.all)
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    
    static let modelData = ModelData()
    static var previews: some View {
        LandmarkList()
            .environmentObject(modelData)
    }
    
}
