//
//  ListViewModel.swift
//  TodoList
//
//  Created by EDSON SANTOS on 05/10/2023.
//

import Foundation

class ListViewModel: ObservableObject {
    
    let itemsKey: String = "item_list"
    @Published var items: [ItemModel] = []{
        //Always somthing changed is called this didSet
        didSet{
            saveItems()
        }
    }
    
    init() {
        getItems()
    }
    
    func getItems(){
        guard 
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        
        self.items = saveItems
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
        
        if let index = items.firstIndex(where: { $0.id == item.id}){
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
