//
//  IntroView.swift
//  TurdGo
//
//  Created by Scholar on 6/13/23.
//

import SwiftUI

struct IntroView: View {
    @State private var showLocations = false
    @State private var showComments = false
   

    var body: some View {
        
        ZStack (alignment: .top) {
            MapViewRepresentable()
                .ignoresSafeArea()
            
            // if you are not searching for location
            if (showLocations == false) {
                // show button
                let _ = print("hello")
                LocationSearchView()
                    .onTapGesture { //when this is pressed ...
                        withAnimation {
                            showLocations = true
                        }
                    }
                    .padding()
            } else {
                // show locations
                AddressListView(showComment: $showComments)
                    
            }
         
            if (showComments) {
                withAnimation {
                    MakeComment(showHome: $showLocations, showComments: $showComments, genderNeutral: false, wheelChairAccessible: false, babyChangingStations: false)
                }
                
            }
            
            
//            NavButton(showLocationSearch: $showLocations)
//                .padding(.leading)
//                .padding(.top, 4)
        }
        .navigationBarBackButtonHidden(true)
        
    }
}



struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
