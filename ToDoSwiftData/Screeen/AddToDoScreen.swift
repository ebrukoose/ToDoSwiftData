//
//  AddToDoScreen.swift
//  ToDoSwiftData
//
//  Created by EBRU KÖSE on 17.10.2024.
//

import SwiftUI
import SwiftData
struct AddToDoScreen: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var name : String = ""
    @State private var priority : Int?
    
    
    private var isFormValid : Bool{
        name.trimmingCharacters(in: .whitespaces).isEmpty && priority == nil
    }
    var body: some View{
        NavigationStack{
            Form{
                TextField ("Name ", text : $name)
                TextField ("priority", value: $priority, format: .number)
                
                
            }
            .navigationTitle("TOdo")
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button(action: {
                        //dismiss
                        dismiss()
                    }, label: {
                        Text("Dismiss")
                    })
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        //save
                        guard let oncelik = priority else{return}
                        let todo = ToDo(isim: name, oncelik: oncelik)
                        context.insert(todo)
                        
                        
                        do{
                            try context.save()
                        }catch {
                            print(error.localizedDescription)
                        }
                        dismiss()
                    }, label: {
                        Text("Save")
                    }).disabled(isFormValid)
                }
            }
        }
    }
}
#Preview {
    AddToDoScreen().modelContainer(for: [ToDo.self])
}
