//
//  Alert.swift
//  Project3
//
//  Created by Anna Han on 12/9/20.
//

import UIKit
extension UIViewController {
    
    func alert(title: String = "Alert", message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "confirm", style: .default, handler: nil)
        
        present(alert, animated: true, completion: nil)
        
    }
}
