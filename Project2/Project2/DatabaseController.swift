//
//  DatabaseControllerController.swift
//  Project2
//
//  Created by Anna Han on 11/12/20.
//

import Foundation
import CoreData

class DatabaseController {
    
    static let shared = DatabaseController()
    
    private init(){
        //can't be called directly
    }
    
    var mainShoppingListContext: NSManagedObjectContext {
        return DatabaseController.persistentContainer!.viewContext
    }
    
     var shoppingListArray = Array<ShoppingList>()
    
    
    func fetchData()  {
        
        let managedObjectContext = DatabaseController.getContext()
        
        let fetchRequest: NSFetchRequest = ShoppingList.fetchRequest()
        
        do {
            let fetchResult = try managedObjectContext.fetch(fetchRequest)
            
            if(fetchResult.count > 0){
                DatabaseController.shared.shoppingListArray.append(contentsOf: fetchResult)
            }
            
        }catch{
            print(exception.self)
        }
        
        
       
        
    }
    
    
    func addShoppingList(newShoppingList:ShoppingList){
        DatabaseController.shared.shoppingListArray.append(newShoppingList)
        
    }
    
    
    
    func createShoppingList(newName: String, newDescription:String, newCategory:String) {
        let shoppingList = ShoppingList(context: DatabaseController.getContext())
        shoppingList.shoppingListName = newName
        shoppingList.shoppingListDescription = newDescription
        shoppingList.shoppingListCategory = newCategory
        
        DatabaseController.shared.addShoppingList(newShoppingList: shoppingList)
        DatabaseController.shared.saveContext()
        
        NotificationCenter.default.post(Notification(name: Notification.Name("New_ShoppingList")))
    }
    func  shoppingList() -> Array<ShoppingList> {
        return DatabaseController.shared.shoppingListArray
    }
    
    
    
    
    
    // MARK: - Core Data stack
    static var persistentContainer:NSPersistentContainer? = nil
    
    
    
    

    class func getContext() -> NSManagedObjectContext{
        
        if(persistentContainer == nil){
            persistentContainer = NSPersistentContainer(name: "ToDoList")
            persistentContainer?.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
  
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
        }
        
        
        return persistentContainer!.viewContext
}
    
    

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = DatabaseController.persistentContainer?.viewContext
        if (context?.hasChanges)! {
            do {
                try context?.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
