//
//  WelcomeManager.swift
//  500px
//
//  Created by KhrystynaShevchuk on 5/27/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import UIKit

class WelcomeManager {
 
    func getWelcomeItems() -> [WelcomeItem] {
        let item1 = WelcomeItem(title: "first image", image: UIImage(named: "image"))
        let item2 = WelcomeItem(title: "second image", image: UIImage(named: "image2"))
        let item3 = WelcomeItem(title: "third image", image: UIImage(named: "image"))

        return [item1, item2, item3]
    }
}