//
//  ComposeViewController.swift
//  Project2
//
//  Created by Anna Han on 11/17/20.
//

import UIKit

class ComposeViewController: UIViewController {

    var editTarget: Memo?
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var memoTextView: UITextView!
    
    @IBAction func save(_ sender: Any) {
        
        
        guard  let memo = memoTextView.text, memo.count > 0 else{
        alert(message: "Write memo")
        return
      }
        if let target = editTarget{
            target.content = memo
            Datamanagement.shared.saveContext()
            NotificationCenter.default.post(name: ComposeViewController.memoDidChanged, object: nil)
            
        }else{
            Datamanagement.shared.addNewMemo(memo)
            NotificationCenter.default.post(name: ComposeViewController.newMemoDidInsert, object: nil)
        }
        
        
       
        
        
        
        dismiss(animated: true, completion: nil)
        
       
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let memo = editTarget{
            
            navigationItem.title = "edit"
            memoTextView.text = memo.content
        }else{
            navigationItem.title = "New Memo"
            memoTextView.text = ""
            
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
extension ComposeViewController{
    
    static let newMemoDidInsert = Notification.Name(rawValue: "newMemoDidInsert")
    static let memoDidChanged = Notification.Name(rawValue: "memoDidChange")
}
