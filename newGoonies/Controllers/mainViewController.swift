//
//  mainViewController.swift
//  newGoonies
//
//  Created by Duru Uğurlu on 7/13/21.
//

import UIKit
import Firebase

class mainViewController: UIViewController {

    @IBOutlet weak var dealsButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        segueToProfile()
        configureUI()
    }
    
    func segueToProfile () {
        profileImage.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(goToProfile))
        profileImage.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func goToProfile() {
        performSegue(withIdentifier: "toProfile", sender: nil)
    }
    
    func configureUI() {
        let profilePic = UserDefaults.standard.object(forKey: "profilePhoto") as? NSData
        if profilePic == nil {
            profileImage.image = UIImage(named: "notSelected")
        } else {
            profileImage.image = UIImage(data: profilePic! as Data)
        }
        
        roundedImage()
    }

    func roundedImage(){
            profileImage.backgroundColor = UIColor.black
            profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
            profileImage.clipsToBounds = true
            profileImage.layer.borderWidth = 4
            profileImage.layer.borderColor = UIColor.white.cgColor
        }
    @IBAction func dealsPressed(_ sender: Any) {
        performSegue(withIdentifier: "toDeals", sender: nil)
    }
}
