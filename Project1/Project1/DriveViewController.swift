//
//  DriveViewController.swift
//  Project1
//
//  Created by Anna Han on 10/26/20.
//

import UIKit
import CoreLocation
import MapKit

class DriveViewController:UIViewController, CLLocationManagerDelegate{
    
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet var lbLocationInfo1: UILabel!
    
    @IBOutlet var lbLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbLocationInfo1.text = ""
        lbLocationInfo2.text = ""
        
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = 40
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
        mapView.showsUserLocation = true
        
       
    }
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("ENTERED!")
    }
    
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span:Double)-> CLLocationCoordinate2D{
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)

        mapView.setRegion(pRegion, animated: true)
        return pLocation
    }
    //show pin with title and subtitle
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span:Double, title strTitle: String, subtitle strSubTitle: String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubTitle
        mapView.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let pLocation = locations.last

        goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        //CLGeocoder():converting between a coordinate (specified as a latitude and longitude) and the user-friendly representation of that coordinate.  consists of the street, city, state, and country information
        //reverseGeocodeLocation:submits the specified location data to the geocoding server asynchronously and returns
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (CLPlacemark, Error) ->Void in
            let pm = CLPlacemark?.first
            var address:String = ""

            if pm?.thoroughfare != nil{
                address += " "
                address += (pm?.thoroughfare)!
            }
            if pm?.locality != nil{
                address += " "
                address += (pm?.locality)!
            }
 
            self.lbLocationInfo1.text = "Current location: \(address)"
            if let currLatitude = pLocation?.coordinate.latitude, let currLong = pLocation?.coordinate.longitude{
                self.lbLocationInfo2.text = "Latitude: \(currLatitude)\nLongitude: \(currLong)"
            }
           
            
        })
        locationManager.stopUpdatingLocation()
//        if let currentLocation = locations.first{
//            manager.startUpdatingLocation()
//            print(currentLocation.coordinate)
// //           print(currentLocation.distance(from: currentLocation))
//            let mapRegion = MKCoordinateRegion(center: currentLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
//            mapView.setRegion(mapRegion, animated: true)
 //       }
        
    }
    
    
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        //self.locationManager.stopUpdatingLocation()
        if sender.selectedSegmentIndex == 0{

            
            self.lbLocationInfo1.text = ""
            self.lbLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
            
        }else if sender.selectedSegmentIndex == 1 {
            
            setAnnotation(latitudeValue: 43.6153717, longitudeValue: -116.2018375, delta: 0.1, title: "City Hall of Boise", subtitle: "150 N Capital Blvd,Boise")
            
            self.lbLocationInfo1.text = "Current location"
            self.lbLocationInfo2.text = "City Hall of Boise"
//            let cityHallBoise = CLLocationCoordinate2D(latitude: 43.6153717, longitude: -116.2018375)
//            let geofenceRegion = CLCircularRegion(center: cityHallBoise, radius: 100.0*10000.0, identifier: "cityHallBoise")
//            locationManager.stopMonitoring(for: geofenceRegion)
        }else if sender.selectedSegmentIndex == 2 {
          
            setAnnotation(latitudeValue: 43.602491, longitudeValue: -116.163844, delta: 0.1, title: "Botanical Garden", subtitle: "2355 N Old Penitentiary RD,Boise")
            
            self.lbLocationInfo1.text = "Current location"
            self.lbLocationInfo2.text = "Botanical Garden"
        }


    }
}
