//
//  InvitationTableViewCell.swift
//  Project2
//
//  Created by Anna Han on 11/16/20.
//

import UIKit

class InvitationTableViewCell: UITableViewCell {

    
    static let identifier = "InvitationTableViewCell"
    
  
  //  @IBOutlet weak var InvitationLabel: UILabel!
    
    @IBOutlet weak var InvitationButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
