import SwiftUI

struct MakeComment: View {
  @State private var selectedRating = 0
  @State var genderNeutral : Bool
  @State var wheelChairAccessible : Bool
  @State var babyChangingStations : Bool
  @State private var review = ""
  @State private var textTitle = ""
  
  var body: some View {
      ZStack{
          Color("blue")
              .ignoresSafeArea()
          VStack {
              
              Spacer()
              
              Text("Rating")
                .font(.custom("CarterOne", size: 50))
                .foregroundColor(Color("yellow"))
                
              
              // rating
              
              HStack {
                ForEach(1...5, id: \.self) { index in
                  Button(action: {
                    selectedRating = index
                  }) {
                    Image(systemName: index <= selectedRating ? "star.fill" : "star")
                          .resizable()
                          .frame(width: 50, height: 50)
                          .foregroundColor(index <= selectedRating ? .yellow : Color("yellow"))
                  }
                }
              } .padding(.bottom, 30)
              
              Toggle(isOn: $genderNeutral) {
                  Text("Gender Neutral")
                      .font(.headline)
                      .fontWeight(.bold)
                      
                      .foregroundColor(Color("yellow"))
              }
              .padding()
              .background(Rectangle() .foregroundColor(Color("light")))
              .cornerRadius(10)
              
              
              Toggle(isOn: $wheelChairAccessible) {
                  Text("Wheel Chair Accessible")
                      .font(.headline)
                      .fontWeight(.bold)
                      .foregroundColor(Color("yellow"))
              }
              .padding()
              .background(Rectangle() .foregroundColor(Color("light")))
              .cornerRadius(10)
              
              Toggle(isOn: $babyChangingStations) {
                  Text("Baby Changing Stations")
                      .font(.headline)
                      .fontWeight(.bold)
                      .foregroundColor(Color("yellow"))
              }
              .padding()
              .background(Rectangle() .foregroundColor(Color("light")))
              .cornerRadius(10)
              
             
              Spacer()
              
              Text(textTitle)
                .font(.title)
                .multilineTextAlignment(.center)
              
              TextField(text: $review) {
                  Text("Comment")
                      .font(.headline)
                      .foregroundColor(Color("yellow"))
              }
              .multilineTextAlignment(.center)
              .font(.title)
              .foregroundColor(Color("yellow"))
              .border(Color.yellow, width: 1)
              .padding()
              
//              TextField("comment", text: $review)
//                .multilineTextAlignment(.center)
//                .font(.title)
//                .foregroundColor(Color("yellow"))
//                .border(Color.yellow, width: 1)
//                .padding()
              
              
              Button("Submit") {
                textTitle = "\(review)"
              }
              .font(.title2)
              .foregroundColor(Color.yellow)
              .buttonStyle(.bordered)
              .tint(.yellow)
          //      }
        } //end of vstack
      }
      
  }
}


struct MakeComment_Previews: PreviewProvider {
  static var previews: some View {
    MakeComment(genderNeutral: false, wheelChairAccessible: false,babyChangingStations: false)
  }
}

