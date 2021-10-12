//
//  UIViewControllerAlert.swift
//  Project2
//
//  Created by Anna Han on 11/17/20.
//

import UIKit
//for all UIViewController
extension UIViewController{
    func alert(title:String = "", message: String)  {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        
        //make button for alert
        let okAction = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        //add on alert controller
        alert.addAction(okAction)
        //show
        present(alert, animated: true, completion: nil)
    }
    
}
