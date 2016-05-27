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
    
    var items = [WelcomeItem]()
    let welcomeManager = WelcomeManager()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = welcomeManager.getWelcomeItems()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        setupScrollView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Private
    
    private func setupScrollView() {
        let screenSize = UIScreen.mainScreen().bounds
        let width = screenSize.width
        let height = screenSize.height - 64
        let screenAmount = items.count
        
        scrollView.backgroundColor = UIColor.blackColor()
        scrollView.contentSize = CGSizeMake(width * CGFloat(screenAmount), height)
        print(scrollView.contentSize.width, scrollView.contentSize.height)
        
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
}
