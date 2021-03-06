//
//  LocationController.swift
//  Project2
//
//  Created by Anna Han on 11/21/20.
//

import Foundation
import CoreLocation

class LocationController: NSObject, CLLocationManagerDelegate {

    static let locationManager: CLLocationManager = CLLocationManager()
    
    static var currentLocation:CLLocation? = nil
    
    static var sharedLocationController: LocationController = LocationController()
    
    class func startGPS(){
        locationManager.delegate = sharedLocationController
        locationManager.distanceFilter = 1
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    class func stopGPS(){
        locationManager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        LocationController.currentLocation = locations[0]
    }
}
