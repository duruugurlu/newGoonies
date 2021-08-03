//
//  customPageViewController.swift
//  newGoonies
//
//  Created by Duru Uğurlu on 7/4/21.
//

import UIKit

protocol customPageViewControllerDelegate: class {
    func numberOfPage(numberOfPage: Int)
    func pageChangedTo(index: Int)
}

class customPageViewController: UIPageViewController {
    
    weak var customDelegate : customPageViewControllerDelegate?
    var individualPageViewControllerList = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        individualPageViewControllerList = [
            demoPageViewController.getInstance(image: "Walkthrough_1"),
            demoPageViewController.getInstance(image: "Walkthrough_2"),
            demoPageViewController.getInstance(image: "Walkthrough_3"),
            demoPageViewController.getInstance(image: "Walkthrough_4")
        ]
        
        dataSource = self
        delegate = self
        
        customDelegate?.numberOfPage(numberOfPage: individualPageViewControllerList.count)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setViewControllers([individualPageViewControllerList[0]], direction: .forward, animated: true, completion: nil)
    }
    
    func goToPage(index: Int) {
        let currentViewController = viewControllers!.first!
        let currentViewControllerIndex = individualPageViewControllerList.firstIndex(of: currentViewController)!
        let direction: NavigationDirection = index > currentViewControllerIndex ? .forward : .reverse
        setViewControllers([individualPageViewControllerList[index]], direction: direction, animated: true, completion: nil)
    }
    
}


extension customPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let indexOfCurrentPageViewController = individualPageViewControllerList.firstIndex(of: viewController)!
        if indexOfCurrentPageViewController == 0 {
            return nil // To show there is no previous page
        } else {
            // Previous UIViewController instance
            return individualPageViewControllerList[indexOfCurrentPageViewController - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let indexOfCurrentPageViewController = individualPageViewControllerList.firstIndex(of: viewController)!
        if indexOfCurrentPageViewController == individualPageViewControllerList.count - 1 {
            return nil // To show there is no next page
        } else {
            // Next UIViewController instance
            return individualPageViewControllerList[indexOfCurrentPageViewController + 1]
        }
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let currentPageViewController = pageViewController.viewControllers?.first {
            let index = individualPageViewControllerList.firstIndex(of: currentPageViewController)!
            customDelegate?.pageChangedTo(index: index)
        }
    }
}
