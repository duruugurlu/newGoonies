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
    @IBOutlet weak var openOrClose: UILabel!
    @IBOutlet weak var operatingHoursLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var aboutContent: UILabel!
    
    let decoder = JSONDecoder()
    let firestoreDatabase = Firestore.firestore()
    var restaurantInfos : RestaurantInfo?
    var rating : Float?
    var open : Int?
    var close : Int?
    var hours : String?
    var descript: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getInfo()
        configureUI()
        
    }
    
    func configureUI() {
        titleLabel.font = UIFont(name: "Poppins-Bold", size: 15)
        addressLabel.font = UIFont(name: "Poppins-Light", size: 12)
        openOrClose.font = UIFont(name: "Poppins-Medium", size: 12)
        operatingHoursLabel.font = UIFont(name: "Poppins-Bold", size: 12)
        aboutLabel.font = UIFont(name: "Poppins-Bold", size: 15)
        aboutContent.font = UIFont(name: "Poppins-Light", size: 12)
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

                if restaurantInfo != nil {
                    let JSONData = try? JSONSerialization.data(withJSONObject: restaurantInfo!)
                    self.restaurantInfos = try self.decoder.decode(RestaurantInfo.self, from: JSONData!)
                    self.titleLabel.text = self.restaurantInfos?.name
                    self.addressLabel.text = self.restaurantInfos?.address
                    let srating = self.restaurantInfos?.rating
                    self.rating = Float(srating!)
                    self.open = self.restaurantInfos?.open
                    self.close = self.restaurantInfos?.close
                    self.hours = self.restaurantInfos?.operatingHours
                    self.descript = self.restaurantInfos?.description
                    self.configureValues()
                    
                }
            } catch let err {
                print(err)
            }
        }
    }
    
    func configureValues() {
        self.operatingHoursLabel.text = "Operating hours : \(self.hours!)"
        aboutContent.text = descript!
        self.configureStars()
        self.determineOpenClose(open: self.open!, close: self.close!)
    }
    
    func determineOpenClose(open : Int, close : Int) {
        let date = Date() // save date, so all components use the same date
        let calendar = Calendar.current // or e.g. Calendar(identifier: .persian)

        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        
        let currentTime = hour * 100 + minute
        
        if currentTime < close && currentTime > open {
            openOrClose.text = "Open"
            openOrClose.textColor = UIColor(named: "open")
        } else {
            openOrClose.text = "Close"
            openOrClose.textColor = UIColor(named: "close")
        }
    }
  
}
