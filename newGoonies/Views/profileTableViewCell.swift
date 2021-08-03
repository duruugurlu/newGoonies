//
//  profileTableViewCell.swift
//  newGoonies
//
//  Created by Duru Uğurlu on 8/2/21.
//

import UIKit

class profileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    static let identifier = "profileTableViewCell"
            static func nib() -> UINib {
                return UINib(nibName: "profileTableViewCell", bundle: nil)
            }

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
        // Initialization code
    }
    
    func configureUI() {
        cellLabel.font = UIFont(name: "Poppins-Medium", size: 14.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
