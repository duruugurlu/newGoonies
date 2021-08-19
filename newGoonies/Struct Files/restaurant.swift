//
//  restaurant.swift
//  newGoonies
//
//  Created by Duru Uğurlu on 8/19/21.
//

import Foundation

struct RestaurantInfo : Decodable {
    let name : String
    let address : String
    let description : String
    let open : Int
    let close : Int
    let rating : String
    let operatingHours : String
    
    init (rname : String, raddress : String, rdescription : String, ropen : Int, rclose : Int, rrating : String, roperatingHours : String) {
        name = rname
        address = raddress
        description = rdescription
        open = ropen
        close = rclose
        rating = rrating
        operatingHours = roperatingHours
    }
}
