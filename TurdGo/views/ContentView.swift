
//  ContentView.swift
//  TurdGo
//
//  Created by Kelly Bian on 6/12/23.




import SwiftUI

struct ContentView: View {
    @State private var showNewView = false
    @State private var name = ""

    var body: some View {
        NavigationStack {
            ZStack {
            Image("map")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    Text("Welcome to TurdGo!")
                        .font(.title)
                        .bold()
                    TextField("", text: $name)
                                  .disableAutocorrection(true)
                                  .frame(width: 320)
                                  .multilineTextAlignment(.center)
                                  .font(.title)
                                  .border(Color.black, width: 2.5)
                                  .padding()
                                NavigationLink(destination: NameView (name: name)) {
                                  Text("Submit")
                                    .bold()
                                    .foregroundColor(.black)
                              }
                                .foregroundColor(.white)
                                .frame(width: 300, height: 50)
                                .background(Color.blue)
                                .cornerRadius(10)
                        //      Button("Submit Name") {
                        //        SwiftUIView(username: name)
                        //      }
                            }
                            .padding(.top, 70)
                            .padding(.bottom, 70)
                            .background(Rectangle()
                              .foregroundColor(Color(.white)))
                            .cornerRadius(40)
                          }
                        }
                      }
                    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
