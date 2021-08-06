//
//  Extensions.swift
//  newGoonies
//
//  Created by Onur Başdaş on 6.08.2021.
//

import Foundation
import UIKit

extension UIViewController {
    func loadScreen(name: String, identifier : String) {
        let storyBoard: UIStoryboard = UIStoryboard(name: name, bundle: nil)
        let destinationController = storyBoard.instantiateViewController(identifier: identifier)
        destinationController.modalPresentationStyle = .fullScreen
        destinationController.modalTransitionStyle = .crossDissolve
        self.present(destinationController, animated: true, completion: nil)
    }
}
