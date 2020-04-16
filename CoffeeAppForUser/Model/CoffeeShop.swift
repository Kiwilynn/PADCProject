//
//  CoffeeShop.swift
//  CoffeeAppForUser
//
//  Created by Oliver Kramer on 14/04/2020.
//  Copyright © 2020 Kea. All rights reserved.
//

import Foundation
import MapKit

class CoffeeShop{
    
    var id: String
    var name: String
    //var marker: MKPointAnnotation
    var marker: CoffeeShopAnnotation
    /*
    init(id: String, name: String, marker: MKPointAnnotation) {
        self.id = id
        self.name = name
        self.marker = marker
    }*/
    init(id: String, name: String, marker: CoffeeShopAnnotation) {
        self.id = id
        self.name = name
        self.marker = marker
    }
    
}
