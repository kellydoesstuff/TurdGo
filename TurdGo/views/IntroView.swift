//
//  IntroView.swift
//  TurdGo
//
//  Created by Scholar on 6/13/23.
//

import SwiftUI

struct IntroView: View {
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



struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
