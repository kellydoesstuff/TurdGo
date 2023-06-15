//
//  ToDoItem.swift
//  TurdGo
//
//  Created by Scholar on 6/15/23.
//

class ToDoItem: Identifiable {
    var id = UUID()
    var title = ""
//    var title : String
    var isImportant = false
    var isGenderNeutral = false
    var hasBabyChanging = false
//    var isImportant : Bool

    init(title: String, isImportant: Bool = false, isGenderNeutral: Bool = false, hasBabyChanging: Bool = false) {
            self.title = title
            self.isImportant = isImportant
            self.isGenderNeutral = isGenderNeutral
            self.hasBabyChanging = hasBabyChanging
    }
}
import Foundation

