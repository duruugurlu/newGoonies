//
//  paymentCollectionViewCell.swift
//  newGoonies
//
//  Created by Duru Uğurlu on 8/9/21.
//

import UIKit

class paymentCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var paymentImage: UIImageView!
    
    static let identifier = "paymentCollectionViewCell"
            static func nib() -> UINib {
                return UINib(nibName: "paymentCollectionViewCell", bundle: nil)
            }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
