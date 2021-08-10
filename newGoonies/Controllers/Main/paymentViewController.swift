//
//  paymentViewController.swift
//  newGoonies
//
//  Created by Duru Uğurlu on 8/9/21.
//

import UIKit
import SafariServices
import StoreKit

class paymentViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    
    @IBOutlet weak var paymentCollectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var homeButton: UIButton!
    
    var paymentArray = [UIImage]()
    private var models = [SKProduct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        fetchProducts()
        SKPaymentQueue.default().add(self)
    }
    
//    Prepare User Interface
    
    func configureUI() {
        titleLabel.font = UIFont(name: "Poppins-Bold", size: 16.0)
        
        paymentCollectionView.dataSource = self
        paymentCollectionView.delegate = self
        paymentCollectionView.register(paymentCollectionViewCell.nib(), forCellWithReuseIdentifier: paymentCollectionViewCell.identifier)
        
        paymentArray.append(UIImage(named: "bankCard")!)
        paymentArray.append(UIImage(named: "creditCard")!)
        paymentArray.append(UIImage(named: "cash")!)
        paymentArray.append(UIImage(named: "paypal")!)

    }
    
//    Payment Collection View configuration
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return paymentArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = paymentCollectionView.dequeueReusableCell(withReuseIdentifier: "paymentCollectionViewCell", for: indexPath) as! paymentCollectionViewCell
        cell.paymentImage.image = paymentArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 342, height: 133)
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc = SFSafariViewController(url: URL(string: "https://i.pinimg.com/originals/38/ff/a4/38ffa4616c7e43522afa0d3569fb522b.gif")!)
            present(vc, animated: true, completion: nil)
        }
        if indexPath.row == 1 {
            let payment = SKPayment(product: models[0])
            SKPaymentQueue.default().add(payment)
        }
    }
    
//    Payment
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        DispatchQueue.main.async {
            self.models = response.products
        }
    }
    
    enum Product : String, CaseIterable {
        case Whopper = "com.myapp.Whopper"
        case IceCream = "com.myApp.IceCream"
    }

    private func fetchProducts() {
        let request = SKProductsRequest(productIdentifiers: Set(Product.allCases.compactMap({$0.rawValue})))
        request.delegate = self
        request.start()
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
//        no impl
    }
    
//    Back to Main
    
    @IBAction func homePressed(_ sender: Any) {
        loadScreen(name: "Main", identifier: "first")
    }
    
}
