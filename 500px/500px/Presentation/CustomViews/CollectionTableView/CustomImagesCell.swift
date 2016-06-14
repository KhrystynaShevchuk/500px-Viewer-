//
//  CustomImagesCell.swift
//  500px
//
//  Created by KhrystynaShevchuk on 6/14/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import UIKit

class CustomImagesCell: UITableViewCell {
    
    var imageView1: UIImageView?
    var imageView2: UIImageView?
    var imageView3: UIImageView?
    var width = UIScreen.mainScreen().bounds.size.width
    var height = UIScreen.mainScreen().bounds.size.height
    let padding: CGFloat = 6
    

    override func awakeFromNib() {
        super.awakeFromNib()
        let imageWidth = (width - padding) / 3
        let xPosition = (imageWidth + padding)
                
        imageView1 = UIImageView(frame: CGRect(x: 0, y: 0, width: imageWidth, height: imageWidth))
        contentView.addSubview(imageView1!)
        imageView2 = UIImageView(frame: CGRect(x: xPosition, y: 0, width: imageWidth, height: imageWidth))
        contentView.addSubview(imageView2!)
        imageView3 = UIImageView(frame: CGRect(x: (xPosition * 2), y: 0, width: imageWidth, height: imageWidth))
        contentView.addSubview(imageView3!)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
