//
//  peximetViewController.swift
//  newGoonies
//
//  Created by Duru Uğurlu on 8/11/21.
//

import UIKit
import Firebase

class peximetViewController: UIViewController {

    @IBOutlet weak var pexSegControl: UISegmentedControl!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pexSegControl.backgroundColor = UIColor(named: "restaurantColor")!
        pexSegControl.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "Poppins-Medium", size: 12)!, NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        switch pexSegControl.selectedSegmentIndex {
            case 0 :
                thirdView.alpha = 0
                secondView.alpha = 0
                firstView.alpha = 1
            case 1 :
                thirdView.alpha = 0
                secondView.alpha = 1
                firstView.alpha = 0
            case 2 :
                thirdView.alpha = 1
                secondView.alpha = 0
                firstView.alpha = 0
            default : break
        }
    }
    
    
}
