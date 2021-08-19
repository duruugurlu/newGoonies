//
//  infoViewController.swift
//  newGoonies
//
//  Created by Duru Uğurlu on 8/19/21.
//

import UIKit
import Firebase

class infoViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    let decoder = JSONDecoder()
    let firestoreDatabase = Firestore.firestore()
    var restaurantInfos : RestaurantInfo?
    var rating : Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getInfo()
        configureUI()
        
    }
    
    func configureUI() {
        titleLabel.font = UIFont(name: "Poppins-Bold", size: 15)
        addressLabel.font = UIFont(name: "Poppins-Light", size: 12)
    }
    
    func configureStars() {
        if rating! >= 0.5 {
            star1.tintColor = UIColor(named: "starColor")
        }
        if rating! >= 1.5 {
            star2.tintColor = UIColor(named: "starColor")
        }
        if rating! >= 2.5 {
            star3.tintColor = UIColor(named: "starColor")
        }
        if rating! >= 3.5 {
            star4.tintColor = UIColor(named: "starColor")
        }
        if rating! >= 4.5 {
            star5.tintColor = UIColor(named: "starColor")
        }
    }
    
    func getInfo() {
        firestoreDatabase.collection("Restaurants").document("peximet").getDocument { (docSnapshot, error) in
            let restaurantInfo = docSnapshot?.data()
            do {
                print("hey")

                if restaurantInfo != nil {
                    let JSONData = try? JSONSerialization.data(withJSONObject: restaurantInfo!)
                    self.restaurantInfos = try self.decoder.decode(RestaurantInfo.self, from: JSONData!)
                    self.titleLabel.text = self.restaurantInfos?.name
                    self.addressLabel.text = self.restaurantInfos?.address
                    let srating = self.restaurantInfos?.rating
                    self.rating = Float(srating!)
                    self.configureStars()
                }
            } catch let err {
                print(err)
            }
        }
    }
    
}
