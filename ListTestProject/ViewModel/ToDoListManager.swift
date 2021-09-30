//
//  ToDoListManager.swift
//  ListTestProject
//
//  Created by Eduardo David De La Cruz Marrero on 23/9/21.
//

import Foundation

class TodoListManager: ObservableObject {
    
    @Published var items: [Item] = []
    
    init(isForTest: Bool = false)  {
        if isForTest {
            //get my data set to my items array
        }
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        items.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func addItem() {
        items.append(Item(id: UUID(), name: "Newly added"))
    }
    
    func delete(at indexSet: IndexSet) {
        for index in indexSet {
            items.remove(at: index)
        }
    }
    
    static func emptyState() -> TodoListManager {
        let manager = TodoListManager()
        manager.items = []
        return manager
    }
    
    static func fullState() -> TodoListManager {
        let manager = TodoListManager(isForTest: true)
        manager.items = [ Item(id: UUID(), name: "First"),
                          Item(id: UUID(), name: "Second"),
                          Item(id: UUID(), name: "Third")]
        return manager
    }
}
