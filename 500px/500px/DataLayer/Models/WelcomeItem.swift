//
//  WelcomeItem.swift
//  500px
//
//  Created by KhrystynaShevchuk on 5/27/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import UIKit

class WelcomeItem {
    
    var title: String?
    var image: UIImage?
    
    init() {
    
    }
    
    init(title: String?, image: UIImage?) {
        self.image = image
        self.title = title
    }
}
