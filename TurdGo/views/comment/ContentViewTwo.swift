////
////  ContentViewTwo.swift
////  TurdGo
////
////  Created by Scholar on 6/14/23.
////
//
import SwiftUI

struct ContentViewTwo: View {
    
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(
        entity: ToDo.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \ToDo.id, ascending: false) ])
    
    var toDoItems: FetchedResults<ToDo>
    
    
    @State private var showNewTask = false
    var body: some View {
        VStack {
            HStack {
                Text("Reviews")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                Spacer()
                Button(action: {
                    self.showNewTask = true
                    
                }){
                    Text("Add review")
                        .font(.caption)
                    
                }
                
            } // Hstack ends
            .padding()
            Spacer()
            
            List {
                ForEach (toDoItems) { toDoItem in
                    if toDoItem.isImportant == true {
                        Text("♿︎ " + (toDoItem.title ?? "No title"))
                    }
                    else {
                        Text(toDoItem.title ?? "No title")
                    }
                    
                }
                .onDelete(perform: deleteTask)
            }
            
            //            .listStyle(.plain)
            
        } // Vstack ends
        
        if showNewTask {
            NewToDoView(showNewTask: $showNewTask, title: "", isImportant: false)
        }
        
    }
    
    private func deleteTask(offsets: IndexSet) {
        withAnimation {
            offsets.map {toDoItems[$0] }.forEach(context.delete)
            
            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
    
    
    
    struct ContentViewTwo_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
