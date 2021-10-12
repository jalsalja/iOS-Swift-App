//
//  NewMemoViewController.swift
//  Project1
//
//  Created by Anna Han on 11/1/20.
//

import UIKit

class ContentMemoViewController: UIViewController {

    
  
    
    @IBOutlet weak var memoTextView: UITextView!
    
    @IBAction func memoCancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
//    @IBAction func memoSaveButton(_ sender: Any) {
//        if let memo = memoTextView.text {
//           // print(memo)
//
//            let newMemo: MyMemoViewController = MyMemoViewController()
//            var nM = newMemo.dummyMemoList
//            if nM.count > 0 {
//                nM.append(memo)
//            }
//
//
//           // let indexpath = IndexPath(row: nM.count - 1, section: 0)
//
//            print("appended ",nM.count)
//
//            dismiss(animated: true, completion: nil)
//
//        }
//
//
//    }
//
    
    
    @IBAction func newMemoSave(_ sender: Any) {
        
        guard let memo = memoTextView.text, memo.count > 0 else{
            return
        }
        
//        let newMemo = Memo(content: memo)
//        Memo.memoList.append(newMemo)
        Datamanagement.shared.addNewMemo(memo)
        
        //make work at iPhone 11
        NotificationCenter.default.post(name: ContentMemoViewController.newMemoDidInsert, object: nil)
        
        dismiss(animated: true, completion: nil)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//      let update = MyMemoViewController()
//        update.viewWillAppear(true)
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
extension ContentMemoViewController {
    static let newMemoDidInsert = Notification.Name(rawValue: "newMemoDidInsert")
}
