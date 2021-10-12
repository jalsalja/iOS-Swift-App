//
//  ShoppingListViewController.swift
//  Project2
//
//  Created by Anna Han on 11/21/20.
//

import UIKit

class ShoppingListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    
 
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DatabaseController.shared.shoppingListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopingListCell")
        
        let currentShoppingList = DatabaseController.shared.shoppingListArray[indexPath.row]
        cell?.textLabel?.text = currentShoppingList.shoppingListName
        return cell!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        LocationController.startGPS()
        NotificationCenter.default.addObserver(self, selector: #selector(shoppingListUpdated(notification:)), name: NSNotification.Name("New_ShoppingList"), object: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    @objc
    func  shoppingListUpdated(notification: Notification) {
        tableView.reloadData()
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
