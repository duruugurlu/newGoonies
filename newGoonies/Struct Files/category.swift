//
//  category.swift
//  newGoonies
//
//  Created by Duru Uğurlu on 8/9/21.
//

import Foundation
import UIKit

struct CategoryItem {
    let categoryName : String
    let categoryImage : UIImage
    
    init (name : String, image : UIImage) {
        categoryName = name
        categoryImage = image
    }
}
