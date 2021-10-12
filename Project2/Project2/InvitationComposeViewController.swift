//
//  InvitationComposeViewController.swift
//  Project2
//
//  Created by Anna Han on 11/22/20.
//

import UIKit

class InvitationComposeViewController: UIViewController {

    
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        return f
    }()
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var invitationName: UITextField!
    
    @IBOutlet weak var titleOfParty: UITextField!
       
    @IBOutlet weak var invitationDate: UITextField!
    
    @IBOutlet weak var invitationTime: UITextField!
    
    @IBOutlet weak var invitationDescription: UITextView!
        
    @IBOutlet weak var invitationLocation: UITextField!
    
    var invitation: Invitation?
  
    //var date: Date?
    
    
    
    @IBAction func invitationSave(_ sender: Any) {
        
       // print("inside of save//")
        
        guard  let name = invitationName.text, name.count > 0
        else {
            alert(message: "Insert name")
            return
        }
        let newName = InvitationExample(content: name)
        InvitationExample.dummyInvitationList.append(newName)
            //InvitationDatabseController.invitationShared.addNewInvitation(name)
        
//        let title = titleOfParty.text!
//        print("title", title)
//        let location = invitationLocation.text!
//
//        let dateText = invitationDate.text!
//        print(dateText)
//        let dateFormatter = DateFormatter()
//
//        guard let date = dateFormatter.date(from: dateText) else { return
//
//        }
//        print(date)
//        let time = invitationTime.text!
//        let description = invitationDescription.text!

 
        
//        InvitationDatabseController.invitationShared.addNewInvitation(name, title, location, date, Double(time)!, description)


        

        
        
        NotificationCenter.default.post(name: InvitationComposeViewController.newInvitationDidInsert, object: nil)
       // print(InvitationExample.dummyInvitationList)
        print(name)
        
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
extension InvitationComposeViewController{
    static let newInvitationDidInsert = Notification.Name(rawValue: "newInvitationInserted")
    static let InvitationDidChanged = Notification.Name(rawValue: "InvitationChanged")
}
