//
//  ViewController.swift
//  500px
//
//  Created by KhrystynaShevchuk on 5/27/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var startButton: UIButton!
    
    var items = [WelcomeItem]() {
        didSet {
            setupScrollView()
            configurePageControl()
        }
    }
    
    let welcomeManager = WelcomeManager()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        items = welcomeManager.getWelcomeItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    @IBAction func startButtonAction(sender: AnyObject) {
        performSegueWithIdentifier("segueToCollection", sender: self)
    }
    
    // MARK: - Private
    
    private func setupScrollView() {
        let screenSize = UIScreen.mainScreen().bounds
        let width = screenSize.width
        let height = screenSize.height - 64
        let screenAmount = items.count
        
        scrollView.backgroundColor = UIColor.blackColor()
        scrollView.contentSize = CGSizeMake(width * CGFloat(screenAmount), height)
        scrollView.delegate = self
        
        for i in 0..<screenAmount {
            let item = items[i]
            
            let welcomeItemView = UIView.loadView("WelcomeItenView") as! WelcomeItenView
            welcomeItemView.iconImageView.image = item.image
            welcomeItemView.imageDescriptionLabel.text = item.title
            let xPosition = width * CGFloat(i)
            welcomeItemView.frame = CGRect(x: xPosition, y: 0, width: width, height: height)
            
            scrollView.addSubview(welcomeItemView)
        }
    }
    
    func configurePageControl() {
        startButton.hidden = true
        
        pageControl.numberOfPages = items.count
        pageControl.currentPage = 0  // Set the initial page.
    }
}

// MARK: - UIScrollViewDelegate

extension WelcomeVC: UIScrollViewDelegate {

    func scrollViewDidScroll(scrollView: UIScrollView) {
        let currentPage = floor(scrollView.contentOffset.x / UIScreen.mainScreen().bounds.size.width);
        pageControl.currentPage = Int(currentPage)
        startButton.hidden = (pageControl.currentPage != items.count - 1)
    }
}