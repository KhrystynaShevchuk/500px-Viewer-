//
//  CustomInfoView.swift
//  500px
//
//  Created by KhrystynaShevchuk on 6/21/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import UIKit

class CustomInfoView: UIView {
    
    @IBOutlet weak var infoTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForInterfaceBuilder() {
        infoTextView.backgroundColor = UIColor.blueColor()
    }
}