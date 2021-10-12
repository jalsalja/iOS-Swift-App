//
//  DetailContentViewController.swift
//  Project3
//
//  Created by Anna Han on 12/9/20.
//

import UIKit

class DetailContentViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var memoTableView: UITableView!
    
    var memo: Memo?
    //same formatter from MemoListTableController
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        return f
    }()
    
    
    
    @IBAction func delteMemo(_ sender: Any) {
        let alert = UIAlertController(title: "confirm delete", message: "delete?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "delete", style: .destructive) {[weak self] (action) in
            Datamanagement.shared.deleteMemo(self?.memo)
            self?.navigationController?.popViewController(animated: true)
        }
        alert.addAction(okAction)
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func share(_ sender: Any) {
        guard let memo = memo?.content else {
            return
        }
        let viewControll = UIActivityViewController(activityItems: [memo], applicationActivities: nil)
        present(viewControll, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination.children.first as? ContentMemoViewController {
            vc.editTarger = memo
        }
    }
    
    var token: NSObjectProtocol?
    
    deinit {
        if let token = token{
            NotificationCenter.default.removeObserver(token)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch  indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MemoEachCell", for: indexPath)
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        token = NotificationCenter.default.addObserver(forName: ContentMemoViewController.memoChanged, object: nil, queue: OperationQueue.main, using: {[weak self] (noti) in self?.memoTableView.reloadData()
        })

    }
    

   

}
