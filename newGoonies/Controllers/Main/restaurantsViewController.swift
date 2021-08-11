//
//  restaurantsViewController.swift
//  newGoonies
//
//  Created by Duru Uğurlu on 8/10/21.
//

import UIKit

class restaurantsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    @IBOutlet weak var restaurantsCollectionView: UICollectionView!
    @IBOutlet weak var restaurantLabel: UILabel!
    
    
    var restaurantArray = [Restaurant]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureRestaurants()
        restaurantLabel.font = UIFont(name: "Poppins-SemiBold", size: 17.0)

    }
    
//    Configure the restaurants and collection view prep
    
    func configureRestaurants() {
        restaurantsCollectionView.dataSource = self
        restaurantsCollectionView.delegate = self
        restaurantsCollectionView.register(restaurantsCollectionViewCell.nib(), forCellWithReuseIdentifier: restaurantsCollectionViewCell.identifier)
        
        let peximet = Restaurant.init(name: "Peximet", image: UIImage(named: "peximet")!)
        let aimerlecafe = Restaurant.init(name: "Aimer le Café", image: UIImage(named: "aimerlecafe")!)
        let porter = Restaurant.init(name: "Porter", image: UIImage(named: "porter")!)
        let lacivert = Restaurant.init(name: "Lacivert Restaurant", image: UIImage(named: "lacivert")!)
        
        restaurantArray.append(peximet)
        restaurantArray.append(aimerlecafe)
        restaurantArray.append(porter)
        restaurantArray.append(lacivert)

    }
    
//    Collection view configuration
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = restaurantsCollectionView.dequeueReusableCell(withReuseIdentifier: "restaurantsCollectionViewCell", for: indexPath) as! restaurantsCollectionViewCell
        cell.restaurantImage.image = restaurantArray[indexPath.row].resImage
        cell.restaurantName.text = restaurantArray[indexPath.row].resName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 342, height: 133)
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            loadScreen(name: "Main", identifier: "peximetViewController")
        }
    }
    
    
    
}
