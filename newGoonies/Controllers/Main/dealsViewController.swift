//
//  dealsViewController.swift
//  newGoonies
//
//  Created by Duru Uğurlu on 8/5/21.
//

import UIKit

class dealsViewController: UIViewController {
    
    var itemNum = 1
    @IBOutlet weak var materialsLabel: UILabel!
    @IBOutlet weak var materialsContentLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var instructionstContentLabel: UILabel!
    
    @IBOutlet weak var descriptionsLabel: UILabel!
    @IBOutlet weak var quantLabel: UILabel!
    
    @IBOutlet weak var itemsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    func configureUI() {
        quantityLabel.font = UIFont(name: "Poppins-Bold", size: 15.0)
        itemsLabel.font = UIFont(name: "Poppins-Light", size: 9.0)
        totalLabel.font = UIFont(name: "Poppins-SemiBold", size: 17.0)
        priceLabel.font = UIFont(name: "Poppins-Bold", size: 24.0)
        materialsLabel.font = UIFont(name: "Poppins-Bold", size: 15.0)
        materialsContentLabel.font = UIFont(name: "Poppins-Light", size: 12.0)
        instructionsLabel.font = UIFont(name: "Poppins-Bold", size: 15.0)
        instructionstContentLabel.font = UIFont(name: "Poppins-Light", size: 12.0)
        descriptionsLabel.font = UIFont(name: "Poppins-Bold", size: 15.0)
        quantLabel.font = UIFont(name: "Poppins-Bold", size: 15.0)
        configureQuantity()
    }
    
    func configureQuantity () {
        quantityLabel.text = "\(itemNum)"
        if itemNum != 1 {
            itemsLabel.text = "\(itemNum) items"
        } else {
            itemsLabel.text = "\(itemNum) item"
        }
        
        priceLabel.text = "$ \(17 * itemNum)"
    }
    
    @IBAction func decreasePressed(_ sender: Any) {
        if itemNum != 1 {
            itemNum = itemNum - 1
            configureQuantity()
        }
    }
    
    @IBAction func increasePressed(_ sender: Any) {
        itemNum = itemNum + 1
        configureQuantity()
    }
    
    @IBAction func homePressed(_ sender: Any) {
        loadScreen(name: "Main", identifier: "first")
    }
    
}
