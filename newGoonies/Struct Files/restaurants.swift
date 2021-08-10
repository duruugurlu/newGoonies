//
//  restaurants.swift
//  newGoonies
//
//  Created by Duru Uğurlu on 8/10/21.
//

import Foundation
import UIKit

struct Restaurant {
    var resName : String
    var resImage : UIImage
    
    init(name : String, image : UIImage) {
        resName = name
        resImage = image
    }
}
