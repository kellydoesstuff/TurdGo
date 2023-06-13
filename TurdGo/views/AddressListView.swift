//
//  AddressListView.swift
//  TurdGo
//
//  Created by Kelly Bian on 6/13/23.
//

import SwiftUI

struct AddressListView: View {
    @State private var destinationLocation = ""
    @State private var showLocationSearch = true
    var body: some View {
        VStack {
//            NavButton(showLocationSearch: $showLocationSearch)
//                .padding(.leading)
//                .padding(.top, 4)
                
            TextField("What Location?", text : $destinationLocation)
                .foregroundColor(.black)
                .frame(width: 335, height:32)
                .background(Color(.systemGray4))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.top, 20)
                .padding(.vertical, 15)
                
            
            ScrollView {
                VStack (alignment: .leading) {
                    ForEach (0 ..< 10, id: \.self) { _ in
                        AddressScroll()
                    }
                }
        }
            .padding(.horizontal)
            .padding(.top, 15)
        
        
        }
        .background(.white)
        
    }
}

struct AddressListView_Previews: PreviewProvider {
    static var previews: some View {
        AddressListView()
    }
}
