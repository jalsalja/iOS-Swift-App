//
//  UserViewController.swift
//  Project3
//
//  Created by Anna Han on 12/6/20.
//

import UIKit
import Firebase

class UserViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePickerController = UIImagePickerController()

    @IBAction func logOut(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
        } catch  {
            
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func profileUpload(_ sender: Any) {
     
        let imagePick = UIImagePickerController()
        imagePick.delegate = self
        imagePick.allowsEditing = true
        imagePick.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagePick, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
 

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let choosenImage = info[.editedImage] as! UIImage

       // profileUpload(choosenImage)
        imageView.image = choosenImage
            
        
        dismiss(animated: true, completion: nil)
    }

}
