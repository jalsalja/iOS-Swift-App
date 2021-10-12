//
//  MenuComposeViewController.swift
//  Project2
//
//  Created by Anna Han on 11/22/20.
//

import UIKit

class MenuComposeViewController: UIViewController {

    var editTargetMenu : Menu?
    
    
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
  
    
    @IBOutlet weak var menuTextView: UITextView!
    
    @IBAction func save(_ sender: Any) {
        
        guard let menu = menuTextView.text, menu.count > 0 else{
            
            menuAlert(message: "Insert Menu")
            
            return
        }
       
//        let newMenu = MenuExample(content: menu)
//       MenuExample.dummyMenuList.append(newMenu)
  
        
        //print(MenuExample.dummyMenuList)
        
        if let editTarget = editTargetMenu{
            editTarget.menuContent = menu
            
            MenuDatabaseController.sharedMenuData.saveContext()
            NotificationCenter.default.post(name: MenuComposeViewController.menuDidChanged, object: nil)
            
        }else{
            
            MenuDatabaseController.sharedMenuData.addNewMenu(menu)
            NotificationCenter.default.post(name: MenuComposeViewController.newMenuDidInsert, object: nil)
        }
        
        
      dismiss(animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let menu = editTargetMenu{
            
            navigationItem.title = "Menu Edit"
            menuTextView.text = menu.menuContent
        }else{
            navigationItem.title = "New Menu"
            menuTextView.text = ""
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MenuComposeViewController{
    static let newMenuDidInsert = Notification.Name(rawValue: "newMenuInserted")
    static let menuDidChanged = Notification.Name(rawValue: "menuChanged")
}
