//
//  InvitationDatabaseController.swift
//  Project2
//
//  Created by Anna Han on 11/21/20.
//

import Foundation
import CoreData

class InvitationDatabseController{
    
    static let invitationShared = InvitationDatabseController()
    
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        return f
    }()
    
    private init(){
    
    }
    var invitationMainContext: NSManagedObjectContext{
        return persistentContainer.viewContext
    }

    var invitationList = [Invitation]()
    
    func fetchInvitation(){
        let request: NSFetchRequest<Invitation> = Invitation.fetchRequest()
        let sortByDateDesc = NSSortDescriptor(key: "invitationDate", ascending: false)
        request.sortDescriptors = [sortByDateDesc]
        do {

            invitationList = try invitationMainContext.fetch(request)
        }catch{
            print(error)
        }
    }
    
    func addNewInvitation(_ name:String?){
        let newInvitation = Invitation(context: invitationMainContext)
        
        newInvitation.invitationName = name
        newInvitation.invitationDate = Date()
        
        saveContext()
    }
//    func addNewInvitation(_ newName: String?,_ newTitle: String?, _ newLocation: String?, _ newDate: Date, _ newtime:Double, _ newDescription: String?){
//        let newInvitation = Invitation(context: invitationMainContext)
//          
//        newInvitation.invitationName = newName
//        newInvitation.titleOfParty = newTitle
//        newInvitation.invitationDate = newDate
//        newInvitation.invitationLocation = newLocation
//        newInvitation.invitationTime = newtime
//        newInvitation.invitationDescription = newDescription
//
//        saveContext()
//
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
