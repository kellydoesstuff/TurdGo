//
//  NewToDoView.swift
//  TurdGo
//
//  Created by Scholar on 6/15/23.
//

import SwiftUI

struct NewToDoView: View {
    @Environment(\.managedObjectContext) var context
    @Binding var showNewTask : Bool
    @State var title: String
    @State var isImportant: Bool // wheelchair
    @State var isGenderNeutral : Bool
    @State var hasBabyChanging : Bool

    var body: some View {

        VStack {
            Text("Review")
                .font(.caption)
            TextField("Comment", text: $title)
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(15)
                .padding()
            Toggle(isOn: $isImportant) {
                Text("Wheelchair Accessible♿︎")
            }
            .padding()
            Toggle(isOn: $isGenderNeutral) {
                Text("Gender Neutral🧍‍♀️🧍‍♂️")
            }
            .padding()
            Toggle(isOn: $hasBabyChanging) {
                Text("Baby Changing Stations🍼")
            }
            .padding()
            
            Button(action: {
                self.addTask(title: self.title, isImportant: self.isImportant, isGenderNeutral: self.isGenderNeutral, hasBabyChanging: self.hasBabyChanging)
                self.showNewTask = false
            }){
                Text("Add review")
            }
            .padding()

        }

}
    private func addTask(title: String, isImportant: Bool = false, isGenderNeutral : Bool = false, hasBabyChanging : Bool = false) {
        let task = ToDo(context: context)
        task.id = UUID()
        task.title = title
        task.isImportant = isImportant
        task.isGenderNeutral = isGenderNeutral
        task.hasBabyChanging = hasBabyChanging

        do {
                    try context.save()
        } catch {
                    print(error)
        }

}

    }




struct NewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NewToDoView(showNewTask: .constant(true), title: "", isImportant: false, isGenderNeutral: false, hasBabyChanging: false)

    }



}

