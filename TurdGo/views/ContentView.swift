//
//  ContentView.swift
//  TurdGo
//
//  Created by Kelly Bian on 6/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showLocations = false
    var body: some View {
        ZStack (alignment: .top) {
            MapViewRepresentable()
                .ignoresSafeArea()
            
            if (showLocations == false) {
                LocationSearchView()
                    .padding()
                    .onTapGesture { //when this is pressed ...
                        showLocations = true
                    }
            } else {
                AddressListView()
            }
            
            
//            NavButton(showLocationSearch: $showLocations)
//                .padding(.leading)
//                .padding(.top, 4)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
