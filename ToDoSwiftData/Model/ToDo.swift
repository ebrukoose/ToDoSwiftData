//
//  ToDo.swift
//  ToDoSwiftData
//
//  Created by EBRU KÖSE on 13.10.2024.
//
import SwiftData
import Foundation
@Model
class ToDo{
    var isim: String
    
    var oncelik : Int
    
    init(isim: String, oncelik: Int) {
        self.isim = isim
        self.oncelik = oncelik
    }
}
