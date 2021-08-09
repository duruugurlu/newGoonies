//
//  categoryCollectionViewCell.swift
//  newGoonies
//
//  Created by Duru Uğurlu on 8/9/21.
//

import UIKit

class categoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    static let identifier = "categoryCollectionViewCell"
            static func nib() -> UINib {
                return UINib(nibName: "categoryCollectionViewCell", bundle: nil)
            }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryLabel.font = UIFont(name: "Poppins-SemiBold", size: 13.0)
    }

}
