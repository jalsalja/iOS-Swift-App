//
//  DetailContentViewController.swift
//  Project2
// 
//  Created by Anna Han on 11/2/20.
//

import UIKit

class DetailContentViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var memoTableView: UITableView!
    
    @IBAction func deleteMemo(_ sender: Any) {
        
        let alert = UIAlertController(title: "Confirm delete", message: "Delete Memo?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "delete", style: .destructive) {[weak self] (action) in
            
            Datamanagement.shared.deleteMemo(self?.memo)
            //see the navigation controller again
            //after delete pop the view--> it's not working properly?
            self?.navigationController?.popViewController(animated: true)
            
        }
        alert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    var memo: Memo?
    //same formatter from MemoListTableController
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        return f
    }()
    
      override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        if segue.identifier == "editSegue"{
            
            if let vc = segue.destination.children.first as? ComposeViewController{
              vc.editTarget = memo
          }
      }
      }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch  indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)
            cell.textLabel?.text = memo?.content
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath)
            cell.textLabel?.text = formatter.string(for: memo?.insertDate)
            
            return cell
        default:
            fatalError()
        }
    }
    
    //dismiss for observer
    var token: NSObjectProtocol?
    deinit {
        if let token = token{
            NotificationCenter.default.removeObserver(token)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        token = NotificationCenter.default.addObserver(forName: ComposeViewController.memoDidChanged, object: nil, queue: OperationQueue.main, using: {[weak self] (noti) in self?.memoTableView.reloadData()})
        // Do any additional setup after loading the view.
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
