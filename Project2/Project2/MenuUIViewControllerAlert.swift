//
//  MenuUIViewControllerAlert.swift
//  Project2
//
//  Created by Anna Han on 11/22/20.
//

import UIKit

extension UIViewController{
    
    func menuAlert(title: String = "Alert", message: String){
        
        let menuAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okMenuAction = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        
        menuAlert.addAction(okMenuAction)
        
        present(menuAlert, animated: true, completion: nil)
    }
}
