//
//  ContentView.swift
//  TurdGo
//
//  Created by Kelly Bian on 6/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack{
                Color("yellow")
                    .ignoresSafeArea()
                VStack {
                    Text("TurdGo")
                        .font(.custom("CarterOne", size: 90))
                        .foregroundColor(Color("blue"))
                    Text("Helping you find clean bathrooms on the go.")
                        .padding(.bottom, 20)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color("blue"))
                        .multilineTextAlignment(.center)
                    
                    
                    HStack {
                        Image("toilet")
                            .resizable()
                            .frame(width: 100, height: 100)
                        NavigationLink(destination: IntroView()){
                            Image(systemName: "arrow.right")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color("blue"))
                                .clipShape(Circle())
                                .shadow(color: .black, radius: 3)
                            
                        } //end of navlink
                        
                        
                        

                    }
                        
                } // end of vstack
                .padding()
    
                
            } // end of zstack

            
            
        } // nav stack
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
