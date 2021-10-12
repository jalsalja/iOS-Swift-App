//
//  FoodMapView.swift
//  Project3
//
//  Created by Anna Han on 12/8/20.
//

import UIKit
import Lottie
class FoodMapView: UIViewController{

    
    let aniFoodMapView = AnimationView()
    override func viewDidLoad() {
        super.viewDidLoad()

        setupaniFoodMapView()
        // Do any additional setup after loading the view.
    }
    

    private func setupaniFoodMapView(){
        
        aniFoodMapView .animation = Animation.named("locationPin")
       //aniFoodMapView .frame = view.bounds
        aniFoodMapView.frame = CGRect(x: 100, y: 0, width: 150, height: 150)
        
        //animationView.center = view.center
        aniFoodMapView.backgroundColor = .purple
        aniFoodMapView.contentMode = .scaleAspectFit
        aniFoodMapView.loopMode = .loop
        aniFoodMapView.play()
        view.addSubview(aniFoodMapView )
    }
    

}
