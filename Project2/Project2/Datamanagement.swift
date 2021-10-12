//
//  Datamanagement.swift
//  Project2
//
//  Created by Anna Han on 11/18/20.
//

import Foundation
import CoreData

class Datamanagement {
    
    static let shared = Datamanagement()
    //Singleton
    private init() {
        
    }
    
    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    //read from database
    
    var memoList = [Memo]()
    
    func fetchMemo(){
        //first make fetch request
        let request: NSFetchRequest<Memo> = Memo.fetchRequest()
        
        let sortByDateDesc = NSSortDescriptor(key: "insertDate", ascending: false)
        
        request.sortDescriptors = [sortByDateDesc]
        
        //try throw -> do catch
        do {
            memoList = try mainContext.fetch(request)
        }catch{
            print(error)
        }
        
    }
    
    func addNewMemo(_ memo: String){
        //from database Memo
        let newMemo = Memo(context: mainContext)
        newMemo.content = memo
        newMemo.insertDate = Date()
        //save in memoList, insert in a first row of newMemo
        memoList.insert(newMemo, at: 0)
        //memoList.append(newMemo)
        //save context
        saveContext()
        
    }
    
    func deleteMemo(_ memo: Memo? ){
        
        if let memo = memo{
            mainContext.delete(memo)
            saveContext()
        }
    }
    
// MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "ToDoList")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
               
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
