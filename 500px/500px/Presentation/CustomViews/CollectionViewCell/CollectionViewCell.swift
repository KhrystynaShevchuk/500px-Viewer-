//
//  CollectionViewCell.swift
//  500px
//
//  Created by KhrystynaShevchuk on 6/1/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import UIKit

protocol ImageInfoDelegate: class {
    
    func infoAboutPhoto(index: Int)
}

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    
    var index: Int?
    weak var delegate: ImageInfoDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()

        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action:  #selector(longTap(_:)))
        longPressRecognizer.minimumPressDuration = 1
        
        iconImageView.addGestureRecognizer(longPressRecognizer)
    }
    
    func longTap(sender : UIGestureRecognizer){
        print("Long tap")
        
        delegate?.infoAboutPhoto(index!)
    }
}