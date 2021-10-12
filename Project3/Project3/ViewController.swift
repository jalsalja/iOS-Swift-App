//
//  ViewController.swift
//  Project3
//
//  Created by Anna Han on 12/5/20.
//

import UIKit
import Firebase
import GoogleSignIn


class ViewController: UIViewController {

    
    
    
    //@IBOutlet weak var signInButton: GIDSignInButton!
    
    @IBAction func googleSignIn(_ sender: GIDSignInButton) {
        
        GIDSignIn.sharedInstance().signIn()
    }
   // @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var password: UITextField!

    @IBOutlet weak var email: UITextField!
    
    @IBAction func emaiSignIn(_ sender: Any) {
        
        guard let email = email.text, !email.isEmpty,
              let password = password.text, !password.isEmpty else {
            print("missing data")
            return
            }
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] result, error in
            guard error == nil else {
                self!.showCreateAccount(email: email, password: password)
                return
            }
        })

    }
    
    func showCreateAccount(email: String, password: String){
        
        let alert = UIAlertController(title: "Create Account",
                                  message: "Please create an accout",
                                  preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Create", style: .default, handler: {_ in
            
                    Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            
                        if(error != nil){
                            return
                        }
                    }
        }))
            
               
                
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: {_ in}))
        
        present(alert, animated: true, completion: nil)
    
        }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        
        Auth.auth().addStateDidChangeListener({ (user, err) in
            if user != nil {
                self.performSegue(withIdentifier: "Home", sender: nil)
            }
        })
   }


}

