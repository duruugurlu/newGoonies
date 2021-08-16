//
//  peximetViewController.swift
//  newGoonies
//
//  Created by Duru Uğurlu on 8/11/21.
//

import UIKit

class peximetViewController: UIViewController {

    @IBOutlet weak var pexSegControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        switch pexSegControl.selectedSegmentIndex {
            case 0 : print("index 0")
            case 1 : print("index 1")
            case 2 : print("index 2")
            default : break
        }
    }
    
}
