//
//  MenuDatabaseController.swift
//  Project2
//
//  Created by Anna Han on 11/22/20.
//

import Foundation
import CoreData

class MenuDatabaseController{
    
    static let sharedMenuData = MenuDatabaseController()
    
    
    
    private init(){
        //Can't be called directly
    }
    
    var menuMainContext: NSManagedObjectContext {
       //return MenuDatabaseController.sharedMenuData.persistentContainer.viewContext
        return persistentContainer.viewContext
   }
   
   // var menuListArray = Array<Menu>()
    var menuList = [Menu]()
    
    
    func fetchMenuData()  {
        
        let menuRequest:NSFetchRequest<Menu> = Menu.fetchRequest()
        
        let sortByDateDesc = NSSortDescriptor(key: "menuContent", ascending: false)
        
        menuRequest.sortDescriptors = [sortByDateDesc]
        
        //try throw -> do catch
        do {
            //menuListArray = try MenuDatabaseController.sharedMenuData.menuMainContext.fetch(menuRequest)
            menuList = try menuMainContext.fetch(menuRequest)
        }catch{
            print(error)
        }
        
        
//        let managedMenuContext = MenuDatabaseController.getContext()
//
//        let fetchRequest: NSFetchRequest = Menu.fetchRequest()
//
//        do {
//            let fetchResult = try managedMenuContext.fetch(fetchRequest)
//
//            if(fetchResult.count > 0){
//                MenuDatabaseController.menuListArray.append(contentsOf: fetchResult)
//            }
//
//        }catch{
//            print(exception.self)
//        }
        
        
       
        
    }
    
    
    
     func addNewMenu(_ menu: String){

      //  MenuDatabaseController.sharedMenuData.menuListArray.append(newMenu)

        let newMenu = Menu(context: menuMainContext)
        newMenu.menuContent = menu

       menuList.insert(newMenu, at: 0)
        saveContext()
    }

    func deleteMenu(_ menu: Menu?){

        if let menu = menu{
            menuMainContext.delete(menu)
            saveContext()

        }
    }
//    class func createMenu(newContent: String){
//        let menu = Menu(context: MenuDatabaseController.getContext())
//        menu.menuContent = newContent
//        MenuDatabaseController.addMenuList(newMenu: menu)
//        MenuDatabaseController.sharedMenuData.saveContext()
//
//        NotificationCenter.default.post(Notification(name: Notification.Name("New_MenuList")))
//    }

//    func  menuList() -> Array<Menu> {
//        return MenuDatabaseController.sharedMenuData.menuListArray
//        //MenuDatabaseController.menuListArray
//    }

// MARK: - Core Data stack
//    static var persistentContainer: NSPersistentContainer? = nil
//
//    class func getContext() -> NSManagedObjectContext{
//        if( persistentContainer == nil){
//            persistentContainer = NSPersistentContainer(name: "ToDoList")
//            persistentContainer?.loadPersistentStores(completionHandler: { (storeDescription, error) in
//                if let error = error as NSError? {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//
//                /*
//                 Typical reasons for an error here include:
//                 * The parent directory does not exist, cannot be created, or disallows writing.
//                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
//                 * The device is out of space.
//                 * The store could not be migrated to the current model version.
//                 Check the error message to determine what the actual problem was.
//                 */
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        }
//
//        return persistentContainer!.viewContext
//
//    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "ToDoList")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
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
