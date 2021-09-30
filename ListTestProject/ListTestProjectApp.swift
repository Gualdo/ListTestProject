//
//  ListTestProjectApp.swift
//  ListTestProject
//
//  Created by Eduardo David De La Cruz Marrero on 24/9/21.
//

import SwiftUI

@main
struct ListTestProjectApp: App {
    
    @StateObject var todoManager = TodoListManager()
    
    var body: some Scene {
        WindowGroup {
            TodoListView(todoManager: todoManager)
        }
    }
}
