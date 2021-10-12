//
//  MemoListTableViewController.swift
//  Project3
//
//  Created by Anna Han on 12/9/20.
//

import UIKit

class MemoListTableViewController: UITableViewController {
    
    
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        return f
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Datamanagement.shared.fetchMemo()
        tableView.reloadData()
    //    print(#function)
    }
    
    //when segue create new screen, call before switch to new screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //sender : comes from table view cell
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell){
            // segue to DetailContentViewController
            if let vc = segue.destination as? DetailContentViewController {
              // vc.memo = Memo.dummyMemoList[indexPath.row]
                vc.memo = Datamanagement.shared.memoList[indexPath.row]
            }
        }
    }
    
    //Observer saved in token -> spend lots of space;
    var token: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        token = NotificationCenter.default.addObserver(forName: ContentMemoViewController.newMemoDidInsert, object: nil, queue: OperationQueue.main) { [weak self] (noti) in
             self?.tableView.reloadData()
    }
    }
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       // return Memo.dummyMemoList.count
        return Datamanagement.shared.memoList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Memocell", for: indexPath)

        // Configure the cell...
        let target = Datamanagement.shared.memoList[indexPath.row]
       // let target = Memo.dummyMemoList[indexPath.row]
        cell.textLabel?.text = target.content
        //cell.detailTextLabel?.text = target.insertDate.description
        cell.detailTextLabel?.text = formatter.string(for: target.insertDate)
        

        return cell
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let target = Datamanagement.shared.memoList[indexPath.row]
            Datamanagement.shared.deleteMemo(target)
            Datamanagement.shared.memoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
}
