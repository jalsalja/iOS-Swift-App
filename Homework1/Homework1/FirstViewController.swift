//
//  FirstViewController.swift
//  Homework1
//
//  Created by Anna HAn on 9/5/20.
//  Copyright © 2020 Boise State. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var FirstNameTextFiled: UITextField!
    
    @IBOutlet weak var LastNameTextFiled: UITextField!
    

    
    @IBOutlet weak var OutputLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //OutputLable.text = "Hi"
        
    }

    @IBAction func concatTapped(_ sender: Any) {
   
        let concatenatedString = "Hello  \(String(describing: FirstNameTextFiled.text!)) \(String(describing: LastNameTextFiled.text!)), Nice to meet you!"
        
        OutputLable.text = concatenatedString
    }
    
    


}
