//
//  logInViewController.swift
//  newGoonies
//
//  Created by Duru Uğurlu on 7/8/21.
//

import UIKit
import FirebaseAuth

class logInViewController: UIViewController {

    @IBOutlet weak var lockButton: UIButton!
    @IBOutlet weak var logInView: UIImageView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var passwordInputText: UITextField!
    @IBOutlet weak var userInputText: UITextField!
    @IBOutlet weak var forgetButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var accountLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            configureUI()
        // Do any additional setup after loading the view.
        }
    
    func configureUI() {
        passwordInputText.isSecureTextEntry = true
        passwordInputText.font = UIFont(name: "Poppins-SemiBold", size: 15.0)
        passwordInputText.adjustsFontForContentSizeCategory = true
        userInputText.font = UIFont(name: "Poppins-SemiBold", size: 15.0)
        userInputText.adjustsFontForContentSizeCategory = true
        forgetButton.titleLabel?.font = UIFont(name: "Poppins-Medium", size: 15.0)
        forgetButton.titleLabel?.adjustsFontForContentSizeCategory = true
        accountLabel.font = UIFont(name: "Poppins-Light", size: 15.0)
        accountLabel.adjustsFontForContentSizeCategory = true
        signUpButton.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 15.0)
        signUpButton.titleLabel?.adjustsFontForContentSizeCategory = true
        

    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        performSegue(withIdentifier: "toSignUpVC", sender: nil)
    }
    
    
    @IBAction func lockPressed(_ sender: Any) {
        if passwordInputText.isSecureTextEntry == true {
            lockButton.setImage(UIImage(named: "lockFilled"), for: .normal)
        } else {
            lockButton.setImage(UIImage(named: "lock"), for: .normal)
        }
        passwordInputText.isSecureTextEntry = !passwordInputText.isSecureTextEntry
    }
    
    
    @IBAction func logInPressed(_ sender: Any) {
        if userInputText.text != "" && passwordInputText.text != "" {
            Auth.auth().signIn(withEmail: userInputText.text!, password: passwordInputText.text!) { (authData, error) in
                if error != nil {
                    self.showAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "error")
                } else {
                    self.performSegue(withIdentifier: "toMainVC", sender: nil)
                }
            }
        } else {
            self.showAlert(titleInput: "error", messageInput: "log in error")
        }
    }
    
    func showAlert(titleInput: String, messageInput: String) {
            let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
    
}
