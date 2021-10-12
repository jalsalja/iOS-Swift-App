//
//  FoodLocationViewController.swift
//  Project3
//
//  Created by Anna Han on 12/10/20.
//

import UIKit
import CoreLocation

class FoodLocationViewController: UIViewController, CLLocationManagerDelegate{

  //let manager = LocationController()
    
    
    @IBOutlet weak var placeLabel: UILabel!
    
    
    var manager: CLLocationManager = CLLocationManager()
    
    @IBOutlet weak var yesButton: UIButton!
    
    
    @IBOutlet weak var noButton: UIButton!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBAction func yesAction(_ sender: Any) {
        
        
        
        
        
    }
    
    @IBAction func noAction(_ sender: Any) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        placeLabel.text = "Give Permission to access GPS location"
        // Do any additional setup after loading the view.
       //
        
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard  let first = locations.first else {
            return
        }
        
        placeLabel.text = "longitude \(first.coordinate.longitude) | latitude \(first.coordinate.latitude)"
    }
}
