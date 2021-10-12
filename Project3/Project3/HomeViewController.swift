//
//  HomeViewController.swift
//  Project3
//
//  Created by Anna Han on 12/6/20.
//

import UIKit
import Firebase
import Lottie


class HomeViewController: UIViewController {

    
    @IBOutlet weak var userLabel: UILabel!
    
    let animationView = AnimationView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userLabel.text = Auth.auth().currentUser?.email
        
        setupAnimation()
        
    }
    
    private func setupAnimation(){
        animationView.animation = Animation.named("flight")
        animationView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        animationView.center = CGPoint(x: 200, y: 180)
       // animationView.center = view.center
        animationView.backgroundColor = .magenta
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
        
    }
    
}

