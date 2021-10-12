//
//  DetailsViewController.swift
//  Project1
//
//  Created by Anna Han on 10/28/20.
//

import UIKit
class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var ImageMain: UIImageView!
    
    @IBOutlet weak var LableMain: UILabel!
    
    
    var imageUrl: String?
    var desc: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let img = imageUrl {
            
            if let data = try? Data(contentsOf: URL(string: img)!){
                //show to main thread
                DispatchQueue.main.async {
                    self.ImageMain.image = UIImage(data: data)
                }
            }
        }
        if let d = desc {
            
            self.LableMain.text = d
        }
    }
}
