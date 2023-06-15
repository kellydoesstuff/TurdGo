//
//  LocationSearchViews.swift
//  TurdGo
//
//  Created by Kelly Bian on 6/12/23.
//

import SwiftUI

struct LocationSearchView: View {
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.black)
                .frame(width:8, height : 8)
                .padding(.horizontal)
            
            Text("Which Restroom?")
                .foregroundColor(Color(.black))
            
            Spacer()
            
        }
        .frame(width: 335, height : 50)
        .background(Rectangle()
            .fill(Color.white)
            .shadow(color: .black, radius: 6))
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView()
    }
}
