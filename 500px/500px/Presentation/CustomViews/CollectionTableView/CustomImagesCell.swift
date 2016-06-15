//
//  CustomImagesCell.swift
//  500px
//
//  Created by KhrystynaShevchuk on 6/14/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import UIKit

let imageViewCount: Int = 3

class CustomImagesCell: UITableViewCell {
    
    var imageViews = [UIImageView]()
    let width = UIScreen.mainScreen().bounds.size.width
    let height = UIScreen.mainScreen().bounds.size.height
    let padding: CGFloat = 10
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        let widthForPaddings = padding * CGFloat(imageViewCount - 1)
        let imageWidth = (width - widthForPaddings) / CGFloat(imageViewCount)
        let widthToNextView = imageWidth + padding
        
        for index in 0..<imageViewCount {
            let xPosition: CGFloat = CGFloat(index) * widthToNextView
            
            let imageView = UIImageView(frame: CGRect(x: xPosition, y: 0, width: imageWidth, height: imageWidth))
            imageView.backgroundColor = UIColor.clearColor()
            
            imageViews.append(imageView)
            self.addSubview(imageView)
            
//            imageView.userInteractionEnabled = true
//            let tapRecognizer = UITapGestureRecognizer(target: imageView, action: #selector(CustomImagesCell.imageTapped))
//            imageView.addGestureRecognizer(tapRecognizer)
            
        }
    }
    
//    @objc private func imageTapped(gestureRecognizer: UITapGestureRecognizer) {
//        let tappedImageView = gestureRecognizer.view!
//        tappedImageView.accessibilityPerformMagicTap()
//    }
    
    static func cellHeight() -> CGFloat {
        return UIScreen.mainScreen().bounds.size.width / CGFloat(imageViewCount)
    }
}
