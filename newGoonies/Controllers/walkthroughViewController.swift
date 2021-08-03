//
//  walkthroughViewController.swift
//  newGoonies
//
//  Created by Duru Uğurlu on 7/4/21.
//

import UIKit

class walkthroughViewController: UIViewController, customPageViewControllerDelegate {
    
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var getStarted: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var containerView: UIView!
    
    let customFont = UIFont(name: "Poppins-Light", size: UIFont.labelFontSize)
    
    var myCustomPageViewController: customPageViewController!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let startPage = 0  // Assume the 1st page is the start page
        pageControl.preferredIndicatorImage = UIImage(named: "notSelected")
        pageControl.setIndicatorImage(UIImage(named: "selected"), forPage: startPage)
        pageControl.pageIndicatorTintColor = UIColor(named: "notSelectedColor")
        pageControl.currentPageIndicatorTintColor = UIColor(named: "selectedColor")
        getStarted.isHidden = true
        
        skipButton.titleLabel?.font = UIFontMetrics.default.scaledFont(for: customFont!)
        skipButton.titleLabel?.adjustsFontForContentSizeCategory = true
        

        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }


    }

    @IBAction func skipClicked(_ sender: Any) {
        performSegue(withIdentifier: "toLogInVC", sender: nil)
    }
    
    @IBAction func getStartedClicked(_ sender: Any) {
        performSegue(withIdentifier: "toLogInVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let desinationViewController = segue.destination as? customPageViewController {
            myCustomPageViewController = desinationViewController
            myCustomPageViewController.customDelegate = self
        }
    }
    
    func numberOfPage(numberOfPage: Int) {
        pageControl.numberOfPages = numberOfPage
    }
    
    func pageChangedTo(index: Int) {
        updatePageControlUI(currentPageIndex: index)
        pageControl.currentPage = index
        
    }
    
    func updatePageControlUI(currentPageIndex: Int) {
        pageControl.pageIndicatorTintColor = UIColor(named: "notSelectedColor")
        pageControl.currentPageIndicatorTintColor = UIColor(named: "selectedColor")
        
        (0..<pageControl.numberOfPages).forEach { (index) in
            let activePageIconImage = UIImage(named: "selected")
            let otherPageIconImage = UIImage(named: "notSelected")
            let pageIcon = index == currentPageIndex ? activePageIconImage : otherPageIconImage
            pageControl.setIndicatorImage(pageIcon, forPage: index)
        }
        
        if currentPageIndex == 3 {
            getStarted.isHidden = false
            skipButton.isHidden = true
        } else {
            getStarted.isHidden = true
            skipButton.isHidden = false
        }
    }
    
    @IBAction func pageControlValueChanged(_ sender: Any) {
        let currentPageIndex = pageControl.currentPage
        myCustomPageViewController.goToPage(index: currentPageIndex)
        updatePageControlUI(currentPageIndex: pageControl.currentPage)
    }
    
}
