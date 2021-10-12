//
//  MyMemoViewController.swift
//  Project1
//
//  Created by Anna Han on 11/1/20.
//

import UIKit

class MyMemoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var window: UIWindow?
    
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        return f
    }()
    
    var content: String = ""
    var insertDate: Date = Date()
    
    @IBOutlet weak var MemoTableView: UITableView!
    
    var refresher: UIRefreshControl!
    var dummyMemoList = [ "Today", "Tomorrow"]
    
    //update table
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
      //  DispatchQueue.main.async {
       //let newmemoupdate = NewMemoViewController()
        print("4.viewwillapper before upload",dummyMemoList.count)
//        let cell = MemoTableView.dequeueReusableCell(withIdentifier: "MemoCell")
 //       cell?.reloadInputViews()
        self.MemoTableView.reloadData()
        print("viewwillapper",dummyMemoList.count)
      //  }
        print(#function)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.MemoTableView.delegate = self
        self.MemoTableView.dataSource = self
        
     
        print(#function)
        print("1.viewDidLoad",dummyMemoList.count)
        // Do any additional setup after loading the view.
    }

 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        
        print(#function)
        print("2.numberOfRows",dummyMemoList.count)
        return dummyMemoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath)
        let cell = MemoTableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath)
        let target = dummyMemoList[indexPath.row]
        print(#function)
        print("3.cellForRowAt",dummyMemoList.count)
        cell.textLabel?.text = target
        
        cell.detailTextLabel?.text = formatter.string(from: insertDate)
        
        return cell
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
