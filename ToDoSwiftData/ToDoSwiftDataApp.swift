//
//  ToDoSwiftDataApp.swift
//  ToDoSwiftData
//
//  Created by EBRU KÖSE on 13.10.2024.
//

import SwiftUI

@main
struct ToDoSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ListScreen()
               
            }
        }.modelContainer(for:[ToDo.self])
    }
}
