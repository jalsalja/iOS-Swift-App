//
//  MemoListTableViewController.swift
//  Project1
//
//  Created by Anna Han on 11/2/20.
//

import UIKit

class MemoListTableViewController: UITableViewController {

    
    
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        return f
    }()
    
    @IBAction func memoCellCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Datamanagement.shared.fetchMemo()
        tableView.reloadData()
//        print(#function)
    }
    
    //when segue create new screen, call before switch to new screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //sender : comes from table view cell
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell){
            // segue to DetailContentViewController
            if let vc = segue.destination as? DetailContentViewController {
              // vc.memo = Memo.memoList[indexPath.row]
                vc.memo = Datamanagement.shared.memoList[indexPath.row]
            }
        }
    }
    
    
    //Observer saved in token -> spend lots of space; 
    var token: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //make work at main  ---  important!!!!!!!  without this it was not reload data in high version of iPhone
                                  
       token = NotificationCenter.default.addObserver(forName: ContentMemoViewController.newMemoDidInsert, object: nil, queue: OperationQueue.main) { [weak self] (noti) in
            self?.tableView.reloadData()
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return Memo.memoList.count
        return Datamanagement.shared.memoList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath)

        // Configure the cell...
        let targetList = Datamanagement.shared.memoList[indexPath.row]
       // let targetList = Memo.memoList[indexPath.row]
        cell.textLabel?.text = targetList.content
        //cell.detailTextLabel?.text = formatter.string(from: targetList.insertDate)
        //change for optional
        cell.detailTextLabel?.text = formatter.string(for: targetList.insertDate)
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
