//
//  ToDoListView.swift
//  ToDoSwiftData
//
//  Created by EBRU KÖSE on 17.10.2024.
//

import SwiftUI

struct ToDoListView: View {
    
    let toDos: [ToDo]
    @Environment(\.modelContext)private var context
    
    var body: some View {
        List{
         
                ForEach(toDos){toDo in
                    NavigationLink(value: toDo){
                        HStack{
                            Text(toDo.isim)
                            Spacer()
                            Text(toDo.oncelik.description)
                        }
                    }
                 
                }.onDelete { IndexSet in
                IndexSet.forEach{ index in
                    let todo = toDos[index]
                    context.delete(todo)
                    do{
                        try context.save()
                        
                    }
                    catch{
                        print(error.localizedDescription)
                    }
                }
            }
        }.navigationDestination(for: ToDo.self){  toDo in
            ToDoDetailScreen(ToDO: toDo)
        }
    }
}

#Preview {
    ToDoListView(toDos: [ToDo(isim: "bitirme ödevi ", oncelik: 13)]).modelContainer(for: [ToDo.self])
}
