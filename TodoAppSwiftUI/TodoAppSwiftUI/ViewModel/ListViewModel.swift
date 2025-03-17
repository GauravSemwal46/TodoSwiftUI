//
//  ListViewModel.swift
//  TodoAppSwiftUI
//
//  Created by Gaurav Semwal on 17/03/25.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemKey: String = "items_List"
    
    init() {
        getItems()
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func update(item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompleted()
        }
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func saveItems() {
        if let encodeData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodeData, forKey: itemKey)
        }
    }
    
    func getItems() {
        guard let data = UserDefaults.standard.data(forKey: itemKey) else {
            return
        }
        guard let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data) else {
            return
        }
        
        self.items = saveItems
    }
}
