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
    
    // todo - test
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
            let welcomeItemView = getItemView(item, index: i, width: width, height: height)
            scrollView.addSubview(welcomeItemView)
        }
    }
    
    private func getItemView(item: WelcomeItem, index: Int, width: CGFloat, height: CGFloat) -> UIView {
        let welcomeItemView = UIView.loadView("WelcomeItenView") as! WelcomeItenView
        welcomeItemView.iconImageView.image = item.image
        welcomeItemView.imageDescriptionLabel.text = item.title
        welcomeItemView.frame = viewFrame(index: index, width: width, height: height)
        return welcomeItemView
    }
    
    // todo - test
    func viewFrame(index index: Int, width: CGFloat, height: CGFloat) -> CGRect {
        let xPosition = width * CGFloat(index)
        return CGRect(x: xPosition, y: 0, width: width, height: height)
    }
    
    func configurePageControl() {
        if pageControl.currentPage != 0 {
            return
        }
        
        startButton.hidden = true
        
        pageControl.numberOfPages = items.count
        pageControl.currentPage = 0
    }
    
    // todo - test
    func isButtonVisible(currentPage: Int, totalCount: Int) -> Bool {
        return currentPage != totalCount - 1
    }
}

// MARK: - UIScrollViewDelegate

extension WelcomeVC: UIScrollViewDelegate {

    func scrollViewDidScroll(scrollView: UIScrollView) {
        let currentPage = floor(scrollView.contentOffset.x / UIScreen.mainScreen().bounds.size.width);
        pageControl.currentPage = Int(currentPage)
        
        startButton.hidden = isButtonVisible(pageControl.currentPage, totalCount: items.count)
    }
}