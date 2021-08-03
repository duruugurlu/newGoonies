//
//  profile.swift
//  newGoonies
//
//  Created by Duru Uğurlu on 8/3/21.
//

import Foundation
import UIKit

struct ProfileItem {
    let sectionName : String
    let sectionImage : UIImage
    
    init (name : String, image : UIImage) {
        sectionName = name
        sectionImage = image
    }
}
