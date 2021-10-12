//
//  LocationServies.swift
//  Project3
//
//  Created by Anna Han on 12/9/20.
//

import Foundation
import CoreLocation

enum Result<T> {
    case success(T)
    case failure(Error)
}


//class LocationController: NSObject, CLLocationManagerDelegate  {
//
//    private let manager: CLLocationManager
//
//    init( manager: CLLocationManager = .init()) {
//        self.manager = manager
//        super.init()
//        manager.delegate = self
//    }
//
//
//
//    var newLocation: ((Result<CLLocation>) -> Void)?
//    var didChanteStatus:
//
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        <#code#>
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        <#code#>
//    }
//
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        <#code#>
//    }
//}

class LocationController: NSObject, CLLocationManagerDelegate {

    static let locationManager:CLLocationManager = CLLocationManager()

    static var currentLocation:CLLocation? = nil

    static var sharedLocationController:LocationController = LocationController()

    
    var newLocation: ((Result<CLLocation>) -> Void)?
    var didChangeStatus:((Bool) -> Void)?
    
    var status: CLAuthorizationStatus{
        return LocationController.locationManager.authorizationStatus
    }
    
    func requestLocationAuth(){
        
        LocationController.locationManager.requestWhenInUseAuthorization()
    }
    func getLocation(){
        LocationController.locationManager.requestLocation()
    }
//    class func startGPS(){
//        locationManager.delegate = sharedLocationController
//        locationManager.distanceFilter = 1
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//
//        locationManager.requestWhenInUseAuthorization()
//
//        locationManager.startUpdatingLocation()
//        print(#function)
//        print(currentLocation!)
//    }
//
//
//    class func stopGPS(){
//        locationManager.stopUpdatingLocation()
//
//    }


    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //if let location = LocationController.currentLocation = locations[0]{
        guard  let first = locations.first else {
            return
        }
       
            newLocation?(.success(first))
        
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        newLocation?(.failure(error))
        }
}
