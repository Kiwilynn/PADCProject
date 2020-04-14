//
//  Product.swift
//  CoffeeAppForUser
//
//  Created by Oliver Kramer on 14/04/2020.
//  Copyright © 2020 Kea. All rights reserved.
//

import Foundation

class Product{
    
    var id: String
    var name: String
    var price: String
    
    init(id: String, name: String, price: String){
        self.id = id
        self.name = name
        self.price = price
    }
}
