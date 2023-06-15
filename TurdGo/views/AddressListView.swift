//
//  AddressListView.swift
//  TurdGo
//
//  Created by Kelly Bian on 6/13/23.
//

import SwiftUI

struct AddressListView: View {
    @State private var destinationLocation = ""
    @Binding var showComment : Bool
    @Binding var locationName : String
    @Binding var locationAddress : String
    @EnvironmentObject var viewModel : LocationSearchModel
    
    var body: some View {
        VStack {
//            NavButton(showLocationSearch: $showLocationSearch)
//                .padding(.leading)
//                .padding(.top, 4)

                
            TextField("What Location?", text : $viewModel.queryFragment)
                .foregroundColor(.black)
//                .frame(width: 335, height:32)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
                .padding(.top, 15)
                .padding(.vertical, 20)
                
            
            ScrollView {
                VStack (alignment: .leading) {
                    ForEach (viewModel.results, id: \.self) { result in
                        AddressScroll(name: result.title, address: result.subtitle)
                            .onTapGesture {
                                viewModel.selectLocation(result)
                                locationName = result.title
                                locationAddress = result.subtitle
                                withAnimation(.spring()) {
                                    showComment = true
                                    
                                }
                                
                            }
                    }
                }
            }
//            .padding(.horizontal)
//            .padding(.top, 15)
        
        
        }
        .padding()
        .background(.white)
        
    }
}

struct AddressListView_Previews: PreviewProvider {
    static var previews: some View {
        AddressListView(showComment: .constant(false), locationName: .constant(""), locationAddress: .constant(""))
    }
}
