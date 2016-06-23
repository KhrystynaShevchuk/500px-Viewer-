//
//  CustomImagesCell.swift
//  500px
//
//  Created by KhrystynaShevchuk on 6/14/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import UIKit

protocol ImagePickerDelegate: class {
    
    func selectedImage(index: Int)
}

let imageViewCount: Int = 3

class CustomImagesCell: UITableViewCell {
    
    @IBOutlet weak var tappableView: UIView!
    
    weak var delegate: ImagePickerDelegate?
    var index: Int?
    
    var imageViews = [UIImageView]()
    let width = UIScreen.mainScreen().bounds.size.width
    let height = UIScreen.mainScreen().bounds.size.height
    let padding: CGFloat = 10
        
    override func awakeFromNib() {
        super.awakeFromNib()
       
        let widthForPaddings = padding * CGFloat(imageViewCount - 1)
        let imageWidth = (width - widthForPaddings) / CGFloat(imageViewCount)
        let widthToNextView = imageWidth + padding
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(CustomImagesCell.imageTapped(_:)))
        tappableView.addGestureRecognizer(tapRecognizer)
        
        
        for index in 0..<imageViewCount {
            let xPosition: CGFloat = CGFloat(index) * widthToNextView
            
            let imageView = UIImageView(frame: CGRect(x: xPosition, y: 0, width: imageWidth, height: imageWidth))
            imageView.backgroundColor = UIColor.clearColor()
            
            imageViews.append(imageView)
            insertSubview(imageView, atIndex: 1)
        }
    }
    
    func imageTapped(gestureRecognizer: UITapGestureRecognizer) {
        let tapPoint = gestureRecognizer.locationInView(self.tappableView)
        let imageViewWidth = width / CGFloat(imageViewCount)

        let indexPosition = Int(tapPoint.x / imageViewWidth)
        print("width \(width) , position \(tapPoint.x), calc \(indexPosition) ")
        
        delegate?.selectedImage(index!)        
    }
    
    static func cellHeight() -> CGFloat {
        return UIScreen.mainScreen().bounds.size.width / CGFloat(imageViewCount)
    }
}