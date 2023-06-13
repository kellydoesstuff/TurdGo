//
//  navButton.swift
//  TurdGo
//
//  Created by Kelly Bian on 6/12/23.
//

import SwiftUI

struct NavButton: View {
    @Binding var showLocationSearch : Bool
    var body: some View {
        Button {
            showLocationSearch = false
        } label : {
            Image(systemName: showLocationSearch ? "arrow.left" : "line.3.horizontal")
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 3)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct NavButton_Previews: PreviewProvider {
    static var previews: some View {
        NavButton(showLocationSearch: .constant(true))
    }
}
