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

    var photo : Photo?
    let imageManager = ImageManager()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadBigPhoto()
        addTapGesture()
        setupZoom()
    }
    
    // MARK: - Private
    
    private func loadBigPhoto() {
        photoImageView.image = photo?.smallImage
        imageManager.updatePhoto(photo, withImageSize: .Big, completion: {
            dispatch_async(dispatch_get_main_queue(), {
                self.photoImageView.image = self.photo?.bigImage
            })
        })
    }
    
    private func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ModalVC.tapGestureAction))
        tapGesture.numberOfTapsRequired = 1
        photoImageView.addGestureRecognizer(tapGesture)
        photoImageView.userInteractionEnabled = true
    }
    
    private func setupZoom() {
        scrollImageView.minimumZoomScale = 1.0
        scrollImageView.maximumZoomScale = 3.0
        scrollImageView.delegate = self
    }

    // MARK: - Actions

    func tapGestureAction() {
        self.dismissViewControllerAnimated(true, completion: nil)
        print("TAPPED")
    }
}

// MARK: - UIScrollViewDelegate

extension ModalVC: UIScrollViewDelegate {

    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.photoImageView
    }
}