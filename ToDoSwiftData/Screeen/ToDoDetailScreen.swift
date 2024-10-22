//
//  ToDoDetailScreen.swift
//  ToDoSwiftData
//
//  Created by EBRU KÖSE on 22.10.2024.
//

import SwiftUI
import SwiftData
import UIKit


struct ToDoDetailScreen: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss ) private var dismiss
    @State var name: String = ""
    @State var priority: Int?
    let ToDO: ToDo
    var body: some View {
        Form {
            TextField("name: ", text: $name)
            TextField("priority :", value: $priority, format: .number)
            Button("Update") {
                guard let priority = priority else {return }
                ToDO.isim = name
                ToDO.oncelik = priority
                do {
                    try
                    modelContext.save()
                    
                }
                
                catch {
                    print(error.localizedDescription)
                }
                dismiss()
                
            }
            
        }.onAppear(perform: {
            name = ToDO.isim
            priority = ToDO.oncelik
        })
        
        
    }
}


