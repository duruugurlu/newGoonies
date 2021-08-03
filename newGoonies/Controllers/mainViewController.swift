//
//  mainViewController.swift
//  newGoonies
//
//  Created by Duru Uğurlu on 7/13/21.
//

import UIKit
import Firebase

class mainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func profilePressed(_ sender: Any) {
        performSegue(withIdentifier: "toProfile", sender: nil)
    }
    
    @IBAction func logOutPressed(_ sender: Any) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
