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
    
    @IBOutlet var longPress: UILongPressGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CoffeeShopRepo.startListener(vc: self)
    }
    
     // MARK: - User Location Setup With Authorization
    
    

    @IBAction func longPressGesture(_ sender: Any) {
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
    
    // MARK: - Map View Setup
    
    
}
