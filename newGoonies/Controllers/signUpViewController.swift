//
//  signUpViewController.swift
//  newGoonies
//
//  Created by Duru Uğurlu on 7/8/21.
//

import UIKit
import Firebase

class signUpViewController: UIViewController {

    let firestoreDatabase = Firestore.firestore()
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var lockButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var alreadyAccountLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    func configureUI() {
        alreadyAccountLabel.font = UIFont(name: "Poppins-Light", size: 15.0)
        alreadyAccountLabel.adjustsFontForContentSizeCategory = true
        signInButton.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 15.0)
        signInButton.titleLabel?.adjustsFontForContentSizeCategory = true
        nameTextField.font = UIFont(name: "Poppins-SemiBold", size: 15.0)
        nameTextField.adjustsFontForContentSizeCategory = true
        emailTextField.font = UIFont(name: "Poppins-SemiBold", size: 15.0)
        emailTextField.adjustsFontForContentSizeCategory = true
        passwordTextField.font = UIFont(name: "Poppins-SemiBold", size: 15.0)
        passwordTextField.adjustsFontForContentSizeCategory = false
        passwordTextField.isSecureTextEntry = true
       
    }
    
    @IBAction func signInClicked(_ sender: Any) {
        performSegue(withIdentifier: "signUpToLogIn", sender: nil)
    }
    
    @IBAction func lockPressed(_ sender: Any) {
        if passwordTextField.isSecureTextEntry == true {
            lockButton.setImage(UIImage(named: "lockFilled"), for: .normal)
        } else {
            lockButton.setImage(UIImage(named: "lock"), for: .normal)
        }
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        if emailTextField.text != "" && nameTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authData, error) in
                if error != nil {
                    self.showAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "error")
                } else {
                    let userDictionary = ["email" : self.emailTextField.text!, "username" : self.nameTextField.text!, "password" : self.passwordTextField.text!] as [String : Any]
                    self.firestoreDatabase.collection("Users").document(Auth.auth().currentUser!.email!).setData(userDictionary)
                    self.performSegue(withIdentifier: "signUptoMainVC", sender: nil)
                }
            }
        } else {
            self.showAlert(titleInput: "Error", messageInput: "Please fill all of the required information")
        }
    }
    
    
    func showAlert(titleInput: String, messageInput: String) {
            let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
    
}
