//
//  ListScreen.swift
//  ToDoSwiftData
//
//  Created by EBRU KÖSE on 17.10.2024.
//

import SwiftUI
import SwiftData
struct ListScreen: View {
    
    @Query(sort: \ToDo.isim, order: .forward) private var todos : [ToDo]
    @State private var isPresented: Bool = false
    var body: some View {
        
            ToDoListView(toDos:todos )
        
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing){
                    Button("Add todo"){
                        isPresented = true
                    }
                }
            }).sheet(isPresented: $isPresented,  content: {
                
                NavigationStack{
                    AddToDoScreen()
                }
            })
            
    }
    
}

#Preview {
    NavigationStack{
        ListScreen().modelContainer(for: [ToDo.self])
    }
}
