//
//  demoPageViewController.swift
//  newGoonies
//
//  Created by Duru Uğurlu on 7/4/21.
//

import UIKit

class demoPageViewController: UIViewController {


    @IBOutlet weak var walkthroughView: UIImageView!
    var imageName = String()

      override func viewDidLoad() {
        super.viewDidLoad()
        walkthroughView.image = UIImage(named: imageName)
        
      }
    
    static func getInstance(image: String) -> demoPageViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "demoPageViewController") as! demoPageViewController
        vc.imageName = image
        return vc
      }


}
