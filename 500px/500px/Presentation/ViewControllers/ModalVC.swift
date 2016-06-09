//
//  ModalVC.swift
//  500px
//
//  Created by KhrystynaShevchuk on 6/9/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import Foundation
import UIKit

class ModalVC: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    var photo : Photo? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImageView.image = photo?.image
        photoImageView.reloadInputViews()
    }
    @IBAction func tapGesture(sender: AnyObject) {
        
    }
}