//
//  NewToDoView.swift
//  TurdGo
//
//  Created by Scholar on 6/14/23.
//
//
// hello
//import SwiftUI
//
//struct NewToDoView: View {
//    @Environment(\.managedObjectContext) var context
//    @Binding var showNewTask : Bool
//    @State var title: String
//    @State var isImportant: Bool
//
//    var body: some View {
//
//        VStack {
//            Text("Review")
//                .font(.caption)
//            TextField("Comment", text: $title)
//                .padding()
//                .background(Color(.systemGroupedBackground))
//                .cornerRadius(15)
//                .padding()
//            Toggle(isOn: $isImportant) {
//                Text("Wheelchair")
//            }
//            .padding()
//            Button(action: {
//                self.addTask(title: self.title, isImportant: self.isImportant)
//                self.showNewTask = false
//            }){
//                Text("Add review")
//            }
//            .padding()
//
//        }
//
//}
//    private func addTask(title: String, isImportant: Bool = false) {
//        let task = ToDo(context: context)
//        task.id = UUID()
//        task.title = title
//        task.isImportant = isImportant
//
//        do {
//                    try context.save()
//        } catch {
//                    print(error)
//        }
//
//}
//
//    }
//
//
//
//
//struct NewToDoView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewToDoView(showNewTask: .constant(true), title: "", isImportant: false)
//
//    }
//
//
//
//}
