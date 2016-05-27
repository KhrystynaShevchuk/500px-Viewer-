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
    
    let imageViews = [UIImageView]()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Private
    
    private func setupScrollView() {
        let screenSize = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        let screenAmount = 3
        
        scrollView.backgroundColor = UIColor.blackColor()
        scrollView.contentSize =  CGSizeMake(screenWidth * CGFloat(screenAmount), screenSize.height)
        print(scrollView.contentSize.width, scrollView.contentSize.height)
        
        for i in 0..<screenAmount {
            let imageView = UIImageView(image: UIImage(named: "image.png"))
            let xPosition = screenWidth * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: screenWidth, height: screenSize.height)
            imageView.contentMode = .ScaleAspectFit
            
            scrollView.addSubview(imageView)
            print(xPosition, screenWidth)
        }
        
        print(scrollView.contentSize.width, scrollView.contentSize.height)
    }
}

