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
       Image("map")
              .resizable()
//              .blur(radius: 1.5, opaque: true)
              .ignoresSafeArea()
          VStack {
              
              Spacer()
              
              Text("Rating")
                .padding(.bottom, 10)
                .font(.custom("CarterOne", size: 35))
                .foregroundColor(Color("brown"))
                
              
              // rating
              
              HStack {
                ForEach(1...5, id: \.self) { index in
                  Button(action: {
                    selectedRating = index
                  }) {
                    Image(systemName: index <= selectedRating ? "star.fill" : "star")
                          .resizable()
                          .frame(width: 50, height: 50)
                          .foregroundColor(index <= selectedRating ? Color("brown") : Color("darkYellow"))
                  }
                }
              } .padding(.bottom, 30)
              
              Toggle(isOn: $genderNeutral) {
                  Text("Gender Neutral")
                      .font(.headline)
                      .fontWeight(.bold)
                      
                      .foregroundColor(Color("brown"))
              }
              .padding()
              .frame(width:340)
              .background(Rectangle() .foregroundColor(Color("offWhite")))
              .cornerRadius(10)
              
              
              Toggle(isOn: $wheelChairAccessible) {
                  Text("Wheel Chair Accessible")
                      .font(.headline)
                      .fontWeight(.bold)
                      .foregroundColor(Color("brown"))
              }
              .padding()
              .background(Rectangle() .foregroundColor(Color("offWhite")))
              .frame(width:340)
              .cornerRadius(10)
              
              Toggle(isOn: $babyChangingStations) {
                  Text("Baby Changing Stations")
                      .font(.headline)
                      .fontWeight(.bold)
                      .foregroundColor(Color("brown"))
              }
              .padding()
              .frame(width:340)
              .background(Rectangle() .foregroundColor(Color("offWhite")))
              .cornerRadius(10)
              
             
              Spacer()
              
              Text(textTitle)
                .font(.title)
                .multilineTextAlignment(.center)
              
              TextField(text: $review) {
                  Text("Comment")
                      .font(.headline)
                      .foregroundColor(Color("brown"))
              }
              .multilineTextAlignment(.center)
              .frame(width: 350)
              .font(.title)
              .foregroundColor(Color("brown"))
              .border(Color.brown, width: 2)
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
              .foregroundColor(Color("brown"))
              .buttonStyle(.bordered)
              .tint(.yellow)
          //      }
        } //end of vstack
          .background(Rectangle() .foregroundColor(Color("yellow")))
          .cornerRadius(40)
          .shadow(radius: 3)
      }
      
  }
}


struct MakeComment_Previews: PreviewProvider {
  static var previews: some View {
    MakeComment(genderNeutral: false, wheelChairAccessible: false,babyChangingStations: false)
  }
}

