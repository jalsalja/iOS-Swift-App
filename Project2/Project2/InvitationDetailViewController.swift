//
//  InvitationDetailViewController.swift
//  Project2
//
//  Created by Anna Han on 11/24/20.
//

import UIKit

class InvitationDetailViewController: UIViewController,UITableViewDataSource {
    
    
    
    
    var invitation: Invitation?
    
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        return f
    }()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InvitationNameCell", for: indexPath)
            
            cell.textLabel?.text = invitation?.invitationName
            
            
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleOfPartyCell", for: indexPath)
            cell.textLabel?.text = invitation?.titleOfParty
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InvitationLocationCell", for: indexPath)
            cell.textLabel?.text = invitation?.invitationLocation
            
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InvitationDateCell", for: indexPath)
            cell.textLabel?.text = formatter.string(for: invitation?.invitationDate)
                
            
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InvitationTimeCell", for: indexPath)
            cell.textLabel?.text = formatter.string(for: invitation?.invitationTime)
                
            
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InvitationDescriptionCell", for: indexPath)
            cell.textLabel?.text = invitation?.invitationDescription
            
            return cell
        default:
            fatalError()
        
        }
        
            
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

