//
//  CoffeeShopRepo.swift
//  CoffeeAppForUser
//
//  Created by Oliver Kramer on 14/04/2020.
//  Copyright © 2020 Kea. All rights reserved.
//

import Foundation
import FirebaseFirestore
import MapKit

class CoffeeShopRepo{
    
    private static let db = Firestore.firestore()
    private static let collectionName = "annotations"
    
    static var coffeeShopList = [CoffeeShop]()
    
    static func startListener(vc:ViewControllerWithMap){
        db.collection(collectionName).addSnapshotListener { (snap, error) in
            if let snap = snap {
                
                self.coffeeShopList.removeAll()
                
                for doc in snap.documents{
                    let map = doc.data()
                    
                    let title = map["title"] as! String
                    let subtitle = map["subtitle"] as! String
                    let geoPoint = map["coordinates"] as! GeoPoint
                    
                    let annotation = mapDataAdapter(title: title, subtitle: subtitle, geoPoint: geoPoint)
                    
                    let coffeeShop = CoffeeShop(id: doc.documentID, marker: annotation)
                    
                    self.coffeeShopList.append(coffeeShop)
                }
                vc.updateMarkersOnMap()
            }
        }
    }
    
    static func mapDataAdapter(title: String, subtitle: String, geoPoint: GeoPoint) -> MKPointAnnotation{
        let annotation = MKPointAnnotation()
        
        annotation.title = title
        annotation.subtitle = subtitle
        annotation.coordinate = CLLocationCoordinate2D(latitude: geoPoint.latitude, longitude: geoPoint.longitude)
        
        return annotation
        
    }
}
