//
//  mainViewController.swift
//  newGoonies
//
//  Created by Duru Uğurlu on 7/13/21.
//

import UIKit
import Firebase

class mainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var expLabel: UILabel!
    @IBOutlet weak var dealsButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    
    var categoryArray = [CategoryItem]()
    
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
        loadScreen(name: "Main", identifier: "profileViewController")
    }
    
    func configureUI() {
        let profilePic = UserDefaults.standard.object(forKey: "profilePhoto") as? NSData
        if profilePic == nil {
            profileImage.image = UIImage(named: "notSelected")
        } else {
            profileImage.image = UIImage(data: profilePic! as Data)
        }
        expLabel.font = UIFont(name: "Poppins-Bold", size: 12.0)
        
        configureCategories()
        roundedImage()
    }

    func configureCategories() {
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        categoryCollectionView.register( categoryCollectionViewCell.nib(), forCellWithReuseIdentifier: categoryCollectionViewCell.identifier)
        
        let steak = CategoryItem.init(name: "Steak", image: UIImage(named: "steak")!)
        let vegetables = CategoryItem.init(name: "Vegetables", image: UIImage(named: "vegetables")!)
        let beverages = CategoryItem.init(name: "Beverages", image: UIImage(named: "beverages")!)
        let fish = CategoryItem.init(name: "Fish", image: UIImage(named: "fish")!)
        let wine = CategoryItem.init(name: "Wine", image: UIImage(named: "wine")!)
        let icecream = CategoryItem.init(name: "Ice Cream", image: UIImage(named: "icecream")!)
        
        categoryArray.append(steak)
        categoryArray.append(vegetables)
        categoryArray.append(beverages)
        categoryArray.append(fish)
        categoryArray.append(wine)
        categoryArray.append(icecream)

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCollectionViewCell", for: indexPath) as! categoryCollectionViewCell
        cell.categoryImage.image = categoryArray[indexPath.row].categoryImage
        cell.categoryLabel.text = categoryArray[indexPath.row].categoryName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 100, height: 132)
        }
    
    func roundedImage(){
            profileImage.backgroundColor = UIColor.black
            profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
            profileImage.clipsToBounds = true
            profileImage.layer.borderWidth = 4
            profileImage.layer.borderColor = UIColor.white.cgColor
        }
    @IBAction func dealsPressed(_ sender: Any) {
        loadScreen(name: "Main", identifier: "dealsViewController")
    }
}
