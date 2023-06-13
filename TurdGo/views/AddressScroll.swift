//
//  addressScroll.swift
//  TurdGo
//
//  Created by Kelly Bian on 6/13/23.
//

import SwiftUI

struct AddressScroll: View {
    var body: some View {
        HStack {
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(.blue)
                .accentColor(.white)
                .frame(width:40, height: 40)
        
            VStack(alignment: .leading) {
                Text("Burger King")
                    .font(.body)
                
                Text("123 Your Mom")
                    .font(.system(size : 15))
                    .foregroundColor(.gray)
                
                Divider()
            }
            .padding(.leading, 8)
            .padding(.vertical, 8)
        }
        .padding(.leading)
    }
}

struct AddressScroll_Previews: PreviewProvider {
    static var previews: some View {
        AddressScroll()
    }
}
