//
//  restaurantsCollectionViewCell.swift
//  newGoonies
//
//  Created by Duru Uğurlu on 8/10/21.
//

import UIKit

class restaurantsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var restaurantName: UILabel!
    
    static let identifier = "restaurantsCollectionViewCell"
            static func nib() -> UINib {
                return UINib(nibName: "restaurantsCollectionViewCell", bundle: nil)
            }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        restaurantImage.layer.cornerRadius = restaurantImage.frame.size.width / 8
        restaurantName.font = UIFont(name: "Poppins-Bold", size: 24)
        // Initialization code
    }

}
