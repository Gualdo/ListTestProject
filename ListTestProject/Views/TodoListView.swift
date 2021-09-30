//
//  ContentView.swift
//  ListTestProject
//
//  Created by Eduardo David De La Cruz Marrero on 23/9/21.
//

import SwiftUI

struct TodoListView: View {
    
    @ObservedObject var todoManager: TodoListManager
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(todoManager.items) { item in
                        Text(item.name)
                    }
                    .onDelete { indexSet in
                        todoManager.delete(at: indexSet)
                    }
                    .onMove { indices, newOffset in
                        todoManager.move(indices: indices, newOffset: newOffset)
                    }
                }
                
                if todoManager.items.count == 0 {
                    Text("Please, start by adding items")
                        .foregroundColor(.gray)
                }
            }
            .navigationBarTitle(Text("Todo's"), displayMode: .large)
            .toolbar(content: {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    EditButton()
                    Button {
                        todoManager.addItem()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(todoManager: TodoListManager.emptyState())
            .previewDisplayName("Empty State")
        TodoListView(todoManager: TodoListManager.fullState())
            .previewDisplayName("Full State")
    }
}
