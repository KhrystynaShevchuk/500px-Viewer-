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
    
    @IBOutlet weak var scrollImageView: UIScrollView!
    @IBOutlet weak var photoImageView: UIImageView!

    var photo : Photo? = nil
    
    var zoomGesture = UIPinchGestureRecognizer()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImageView.image = photo?.image
        photoImageView.reloadInputViews()
        photoImageView.userInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ModalVC.tapGesture))
        tapGesture.numberOfTapsRequired = 1
        photoImageView.addGestureRecognizer(tapGesture)
        
        setupZoom()
    }

    // MARK: - Actions

    func tapGesture() {
        self.dismissViewControllerAnimated(true, completion: nil)
        print("TAPPED")
    }
    
    // MARK: - Private

    private func setupZoom() {
        scrollImageView.minimumZoomScale = 1.0
        scrollImageView.maximumZoomScale = 3.0
        scrollImageView.delegate = self
    }
}

// MARK: - UIScrollViewDelegate

extension ModalVC: UIScrollViewDelegate {

    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.photoImageView
    }
}