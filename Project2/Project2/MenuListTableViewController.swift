//
//  MenuListTableViewController.swift
//  Project2
//
//  Created by Anna Han on 11/22/20.
//

import UIKit

class MenuListTableViewController: UITableViewController {
    
    
   

    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        MenuDatabaseController.sharedMenuData.fetchMenuData()
        
        tableView.reloadData()
//        print(MenuExample.dummyMenuList)
 //       print(#function)
    }

    var menutoken: NSObjectProtocol?

    deinit {
        if let menutoken = menutoken{

            NotificationCenter.default.removeObserver(menutoken)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            if let menuVc = segue.destination as? MenuDetailViewController {
                menuVc.menu = MenuDatabaseController.sharedMenuData.menuList[indexPath.row]
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menutoken = NotificationCenter.default.addObserver(forName: MenuComposeViewController.newMenuDidInsert, object: nil, queue: OperationQueue.main) {[weak self] (noti) in
            self?.tableView.reloadData()
            
        }
        
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       // return MenuExample.dummyMenuList.count
        return MenuDatabaseController.sharedMenuData.menuList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
        //cell.textLabel?.text = "test"
        let menuTarget = MenuDatabaseController.sharedMenuData.menuList[indexPath.row]
       cell.textLabel?.text = menuTarget.menuContent

        return cell
    }
    

    
    // For delete on each cell
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //for delete menu
            let target = MenuDatabaseController.sharedMenuData.menuList[indexPath.row]
            //delete from database
            MenuDatabaseController.sharedMenuData.deleteMenu(target)
            //cell count should same
            MenuDatabaseController.sharedMenuData.menuList.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
