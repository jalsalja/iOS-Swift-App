//
//  ComposeViewController.swift
//  Project3
//
//  Created by Anna Han on 12/9/20.
//

import UIKit

class ContentMemoViewController: UIViewController {

    var editTarger: Memo?
    
    @IBOutlet weak var memoTextView: UITextView!
    
    @IBAction func memoCancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    
    @IBAction func newMemoSave(_ sender: Any) {
        
        guard let memo = memoTextView.text, memo.count > 0 else{
            alert(message: "Write a momo")
            return
        }
        
        if let target = editTarger{
            target.content = memo
            Datamanagement.shared.saveContext()
            NotificationCenter.default.post(name: ContentMemoViewController.memoChanged, object: nil)
        }else {
            Datamanagement.shared.addNewMemo(memo)
            NotificationCenter.default.post(name: ContentMemoViewController.newMemoDidInsert, object: nil)
        }
        
        
//        //make work at iPhone 11
       
//
        dismiss(animated: true, completion: nil)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//      let update = MyMemoViewController()
//        update.viewWillAppear(true)
        // Do any additional setup after loading the view.
        if let memo = editTarger{
            navigationItem.title = "Edit"
            memoTextView.text  = memo.content
        }else{
            navigationItem.title = "new memo"
            memoTextView.text = ""
        }
    }
    

   

}
extension ContentMemoViewController {
    static let newMemoDidInsert = Notification.Name(rawValue: "newMemoDidInsert")
    static let memoChanged = Notification.Name(rawValue: "memoChanged")
}
