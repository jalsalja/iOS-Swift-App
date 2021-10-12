//
//  ShoppingListCRUDViewController.swift
//  Project2
//
//  Created by Anna Han on 11/21/20.
//

import UIKit
import CoreData
class ShoppingListCRUDViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    
    @IBOutlet weak var CategoryTextField: UITextField!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveTapped(_ sender: Any) {
       
        DatabaseController.shared.createShoppingList(newName: nameTextField.text!, newDescription: descriptionTextField.text!, newCategory: CategoryTextField.text!)
        
        navigationController?.popViewController(animated: true)
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
