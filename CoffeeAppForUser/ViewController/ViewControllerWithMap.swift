//
//  ViewControllerWithMap.swift
//  CoffeeAppForUser
//
//  Created by Oliver Kramer on 14/04/2020.
//  Copyright © 2020 Kea. All rights reserved.
//

import UIKit
import MapKit
import FirebaseFirestore

class ViewControllerWithMap: UIViewController {

    @IBOutlet weak var map: MKMapView!
        
    private let locationManager = CLLocationManager() // core location manager used to query for gps data
    private let regionInMeters: Double = 10000 // how much we wan't the map to be zoomed in
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        map.delegate = self
        
        checkLocationService()
                
        CoffeeShopRepo.startListener(vc: self)
        
    }
    
     // MARK: - User Location Setup With Authorization
    
    // function that checks if the location services of the device isn't turned off
    func checkLocationService(){
        if CLLocationManager.locationServicesEnabled(){
            setUpLocationManager()
            checkLocationAuthorization()
        }else{
            // create an alert that tells the user to turn on location services
            print("what")
        }
    }
    
    // function that sets up the location manager which handles the user location
    func setUpLocationManager(){
        locationManager.delegate = self // sets the delegate
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // sets the desired accuracy to the best possible accuracy
        
    }
    
    // Checks what kind of authorization is given
    func checkLocationAuthorization(){
        
        switch CLLocationManager.authorizationStatus() {
            
        // When the app is used, we are authorized to access the user location
        case .authorizedWhenInUse:
            print("when in use")
            startUpdatingUserLocationWhenAuthorized()
            break
            
        // If we are denied access by the user
        case .denied:
            print("denied")
            // show an alert to make the user know that it's device hasn't given permission
            break
            
        // first time the app is opened, or if user chooese only to give access one time
        case .notDetermined:
            print("not determined")
            // we net to setup the p-list to be able to ask for authorization
            locationManager.requestWhenInUseAuthorization() // requests the type of authorization that we want
            break
            
        // if the user cannot change this app’s status, possibly due to active restrictions such as parental controls being in place
        case .restricted:
            print("restricted")
            // show alert
            break
            
        // if it's always it should start updating user location
        case .authorizedAlways:
            print("always")
            startUpdatingUserLocationWhenAuthorized()
            break
            
        // if a defailt shpuld come in future updates we are covered by @unkown
        @unknown default:
            print("my default")
            break
        }
    }
    
    
    func startUpdatingUserLocationWhenAuthorized(){
        map.showsUserLocation = true // shows the blue dot on the map
        centerViewOnUserLocation()
        locationManager.startUpdatingLocation() // Calls the didUpdateLocation method in the extension
        //if the user moves, the locationmanager will update the location
    }

    @IBAction func longPressGesture(_ sender: Any) {
    }
    
    
    // MARK: - Map View Setup
    
    
    // centers the view on the user location
    func centerViewOnUserLocation(){
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            map.setRegion(region, animated: true)
        }
    }
    
    func updateMarkersOnMap(){
        // CHECK EFFECIENCY:
        /*
        map.removeAnnotations(map.annotations)
        
        for coffeeShop in CoffeeShopRepo.coffeeShopList{
            map.addAnnotation(coffeeeShop.marker)
        }*/
        
        var markers = [MKPointAnnotation]()
        
        for coffeeShop in CoffeeShopRepo.coffeeShopList{
            markers.append(coffeeShop.marker)
        }
        
        map.removeAnnotations(map.annotations)
        map.addAnnotations(markers)
    }
    
}

extension ViewControllerWithMap: MKMapViewDelegate{
    // function that styles each annotation accept the user location
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        // We use a guard statement to check if the annotation is a user location
        // if the annotation is a user location it shall return nil, or else proceed
        guard !(annotation is MKUserLocation) else { return nil }
        
        // sets the identifier
        let identifier = "annotation"
        
        // Makes sure that we reuse an annotation if it's not in the current view
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        // if there isn't already created annotation available we create a new one
        if annotationView == nil{
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            
            annotationView?.canShowCallout = true
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) // Delete button for annotation
        // if there is one available we reuse it and fills it with data
        }else{
            annotationView?.annotation = annotation
        }
        
        // returns the styles annotation
        return annotationView
        
    }
    
    
    // This function is called when you press the button on an annotation
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        // do something
        
    }
}

extension ViewControllerWithMap: CLLocationManagerDelegate {
    
    // every time the user moves, this function is fired off
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        map.setRegion(region, animated: true)
    }
    
    // if the authorization changes, then we need to call our checkAuthorization function from above
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}
