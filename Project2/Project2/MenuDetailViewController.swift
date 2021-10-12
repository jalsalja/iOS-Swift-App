//
//  MenuDetailViewController.swift
//  Project2
//
//  Created by Anna Han on 11/23/20.
//

import UIKit

class MenuDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var menu: Menu?
    
    
    @IBAction func deleteMenu(_ sender: Any) {
        let alert = UIAlertController(title: "Confirm Delete", message: "Delete?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Delete", style: .destructive ) {[weak self] (action) in
            
            MenuDatabaseController.sharedMenuData.deleteMenu(self?.menu)
            self?.navigationController?.popViewController(animated: true)
        }
        alert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var MenuDetailTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0: let cell = tableView.dequeueReusableCell(withIdentifier: "menuDetailCell", for: indexPath)
            
            cell.textLabel?.text = menu?.menuContent
            
            return cell
        default:
            fatalError()
        
        }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let menuEditVc = segue.destination.children.first as? MenuComposeViewController{
            
            menuEditVc.editTargetMenu = menu
        }
    }
    
    
    var menuDetailToken: NSObjectProtocol?
    
    deinit {
        if let menuDetailToken = menuDetailToken{
            NotificationCenter.default.removeObserver(menuDetailToken)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuDetailToken = NotificationCenter.default.addObserver(forName: MenuComposeViewController.menuDidChanged, object: nil, queue: OperationQueue.main, using: {
            [weak self] (noti) in
            self?.MenuDetailTableView.reloadData()
        })
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
