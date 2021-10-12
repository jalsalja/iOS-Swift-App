//
//  ViewController.swift
//  Project2
//
//  Created by Anna Han on 11/7/20.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        return f
    }()
    
    @IBOutlet weak var tableView: UITableView! = {
    
    //    @IBOutlet weak var tableView: UITableView! = {
    //private let tableView: UITableView = {
        let table = UITableView()

        table.register(InvitationTableViewCell.self, forCellReuseIdentifier: InvitationTableViewCell.identifier)

        table.register(PlanTheMenuTableViewCell.self, forCellReuseIdentifier: PlanTheMenuTableViewCell.identifier)
        
        table.register(ShppingTableViewCell.self, forCellReuseIdentifier: ShppingTableViewCell.identifier)
        table.register(AddTableViewCell.self, forCellReuseIdentifier: AddTableViewCell.identifier)
        return table
    }()
    
    
    
  
    //when segue create new screen, call before switch to new screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //sender : comes from table view cell
        
        if segue.identifier == "newMemoSegue"{
            
            if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell){
                // segue to DetailContentViewController
                if let vc = segue.destination as? DetailContentViewController {
                  // vc.memo = Memo.memoList[indexPath.row]
                    vc.memo = Datamanagement.shared.memoList[indexPath.row - 3 ]
                }
            }
            
        }
       
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("Datamanagement.shared.memoList.count", Datamanagement.shared.memoList.count)
        return Datamanagement.shared.memoList.count + 3
        
   
       // return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        
      //  print(indexPath.row)
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: InvitationTableViewCell.identifier, for: indexPath) as! InvitationTableViewCell
           
          //  print("index 0")
            return cell
        }
        if indexPath.row == 1 {
            print(indexPath.row)
            let cell = tableView.dequeueReusableCell(withIdentifier: PlanTheMenuTableViewCell.identifier, for: indexPath) as! PlanTheMenuTableViewCell
           // cell.textLabel?.text = "Plan The Menu"
          //  cell.MenuLabel.text = "Plan The Menu"
           // print("index 1")
            return cell
        }
        if indexPath.row == 2 {
          //  print("index 2")
            let cell = tableView.dequeueReusableCell(withIdentifier: ShppingTableViewCell.identifier, for: indexPath)
         //   cell.textLabel?.text = "Shopping"
            return cell
        }
    
     
      
            
            let cell = tableView.dequeueReusableCell(withIdentifier: AddTableViewCell.identifier, for: indexPath)
           // cell.textLabel?.text = "Add"
        
            let target = Datamanagement.shared.memoList[indexPath.row - 3]
        
            cell.textLabel?.text = target.content
      
            cell.detailTextLabel?.text = formatter.string(for: target.insertDate)
     
            return cell
       

      
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: AddTableViewCell.identifier, for: indexPath)
//
//          let target = Datamanagement.shared.memoList[indexPath.row]
//           cell.textLabel?.text = target.content
//           cell.detailTextLabel?.text = formatter.string(for: target.insertDate)
//
//    }

    //for delete row
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.row > 2{
            return .delete
        }
        return .none
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let target = Datamanagement.shared.memoList[indexPath.row - 3]
            Datamanagement.shared.deleteMemo(target)
            Datamanagement.shared.memoList.remove(at: indexPath.row - 3 )
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            
        }else if editingStyle == .insert{
            
        }
    }
    
    
    
    
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Datamanagement.shared.fetchMemo()
        
        tableView.reloadData()
          
    }

    //addObserver -> token
    var token:NSObjectProtocol?
    
    deinit {
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        NotificationCenter.default.addObserver(forName: ComposeViewController.newMemoDidInsert, object: nil, queue: OperationQueue.main){ [weak self] (noti) in self?.tableView.reloadData()
            
        }
        
        // Do any additional setup after loading the view.
        DatabaseController.getContext()
    }

    
}

