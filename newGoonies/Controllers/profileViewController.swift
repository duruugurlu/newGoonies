//
//  profileViewController.swift
//  newGoonies
// .
//  Created by Duru Uğurlu on 7/29/21.
//

import UIKit
import Firebase

class profileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileTableView: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var logOutButton: UIButton!
    
    let decoder = JSONDecoder()
    var userInfos : UserInfos?
    let firestoreDatabase = Firestore.firestore()
    var profileItems = [ProfileItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        newGetData()
        profileTableView.reloadData()
        profileTableView.register(profileTableViewCell.nib(), forCellReuseIdentifier: profileTableViewCell.identifier)
        pictureUpload()
    }
    
    func configureUI() {
        logOutButton.titleLabel?.font = UIFont(name: "Poppins-Medium", size: 14.0)
        logOutButton.titleLabel?.adjustsFontForContentSizeCategory = true
        nameLabel.font = UIFont(name: "Poppins-Medium", size: 15.0)
        emailLabel.font = UIFont(name: "Poppins-Light", size: 15.0)
        addressLabel.font = UIFont(name: "Poppins-Light", size: 15.0)
        
        let address = ProfileItem.init(name: "Manage Address", image: UIImage(named: "location")!)
        let payment = ProfileItem.init(name: "Payment", image: UIImage(named: "payment")!)
        let order = ProfileItem.init(name: "Orders", image: UIImage(named: "order")!)
        let favorites = ProfileItem.init(name: "Favorites", image: UIImage(named:"favourite")!)
        let offer = ProfileItem.init(name: "Offers", image: UIImage(named: "offers")!)
        
        profileItems.append(address)
        profileItems.append(payment)
        profileItems.append(order)
        profileItems.append(favorites)
        profileItems.append(offer)
        
        roundedImage()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profileTableView.dequeueReusableCell(withIdentifier: "profileTableViewCell", for: indexPath) as! profileTableViewCell
        cell.cellLabel.text = profileItems[indexPath.row].sectionName
        cell.logoImage.image = profileItems[indexPath.row].sectionImage
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func getData() {
        firestoreDatabase.collection("Users").getDocuments { [self] (querySnapshot, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                for document in querySnapshot!.documents {
                    do {
                        let JSONData = try? JSONSerialization.data(withJSONObject: document.data())
                        self.userInfos = try self.decoder.decode(UserInfos.self, from: JSONData!)
                        nameLabel.text = self.userInfos?.username
                    } catch let err {
                        print(err)
                    }
                }
            }
        }
    }
    
    
    func newGetData() {
        firestoreDatabase.collection("Users").document(Auth.auth().currentUser!.email!).getDocument { (docSnapshot, error) in
            let userInfo = docSnapshot?.data()
            do {
                if userInfo != nil {
                    let JSONData = try? JSONSerialization.data(withJSONObject: userInfo!)
                    self.userInfos = try self.decoder.decode(UserInfos.self, from: JSONData!)
                    self.nameLabel.text = self.userInfos?.username.uppercased()
                    self.emailLabel.text = self.userInfos?.email
                }
            } catch let err {
                print(err)
            }
        }
    }
    
    @IBAction func logOutPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "backToLogInVC", sender: nil)
        } catch {
            print("error")
        }
    }
   
//
    func pictureUpload() {
        profileImage.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        profileImage.addGestureRecognizer(gestureRecognizer)
        let profilePic = UserDefaults.standard.object(forKey: "profilePhoto") as? NSData
        if profilePic == nil {
            profileImage.image = UIImage(named: "notSelected")
        } else {
            profileImage.image = UIImage(data: profilePic! as Data)
        }
    }

    @objc func chooseImage() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        pickerController.allowsEditing = true
        present(pickerController, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            profileImage.contentMode = .scaleAspectFit
            profileImage.image = image
            let imageData : NSData = (image.pngData() as NSData?)!
            UserDefaults().setValue(imageData, forKey: "profilePhoto")
            print(imageData)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func roundedImage(){
            profileImage.backgroundColor = UIColor.black
            profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
            profileImage.clipsToBounds = true
            profileImage.layer.borderWidth = 4
            profileImage.layer.borderColor = UIColor.white.cgColor
        }
}
