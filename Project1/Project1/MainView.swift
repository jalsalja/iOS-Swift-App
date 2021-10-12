//
//  MainView.swift
//  Project1
//
//  Created by Anna Han on 10/28/20.
//

import UIKit

class MainView: UIViewController {
    
    //connect buttons to each storyboard with storyboard identifier
    
    @IBAction func NewsTableButton(_ sender: Any) {
        //to News table view
        if let controller = self.storyboard?.instantiateViewController(identifier: "ViewController"){
            
            self.navigationController?.pushViewController(controller, animated: true)
        }
    
    }
    
    @IBAction func ImageButton(_ sender: Any) {
        //to image view from library and camera
        if let controller = self.storyboard?.instantiateViewController(identifier: "ImageViewController"){
            
            self.navigationController?.pushViewController(controller, animated: true)
        }
    
    }
    
    @IBAction func MapViewButton(_ sender: Any) {
        //to map view
        if let controller = self.storyboard?.instantiateViewController(identifier: "DriveViewController"){
            
            self.navigationController?.pushViewController(controller, animated: true)
        }
    
    }
    
//    @IBAction func MyMemoButten(_ sender: Any) {
//        //to MyMemo view
//        if let controller = self.storyboard?.instantiateViewController(identifier: "MyMemoViewController"){
//            
//            self.navigationController?.pushViewController(controller, animated: true)
//        }
//    
//    }
    
}
