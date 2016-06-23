//
//  CollectionVC1.swift
//  500px
//
//  Created by KhrystynaShevchuk on 6/1/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import UIKit

class CollectionVC: UIViewController {
    
    @IBOutlet weak var photosCollectionView: UICollectionView!
    
    var imageManager = ImageManager()
    let popupView = UIView.loadView("CustomInfoView") as! CustomInfoView
    let screenSize = UIScreen.mainScreen().bounds
    var yPosition: CGFloat = 0
    
    var photos = [Photo]() {
        didSet {
            dispatch_async(dispatch_get_main_queue(), {
                self.photosCollectionView.reloadData()
            })
        }
    }
    
    var selectedPhoto : Photo?
    let photosApi = PhotosAPI()
    
    private let reuseIdentifier = "CollectionViewCell"
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        makePopupViewVisible(false)
        addTapGesture()
        view.addSubview(popupView)
    }
    
    // MARK: - Private
    
    private func loadData() {
        photosApi.downloadPhotos { (photos) in
            self.photos = photos
        }
    }
    
    private func makePopupViewVisible(isViewVisible: Bool) -> UIView {
        
        if isViewVisible == true {
            
            popupView.infoTextView.text = selectedPhoto?.getDescription()
            yPosition = screenSize.height - screenSize.width/2
            setCustomInfoView(yPosition)
            
        } else {
            
            yPosition = screenSize.height
            setCustomInfoView(yPosition)
        }
        
        return popupView
    }
    
    private func setCustomInfoView(yPosition: CGFloat) {
        UIView.animateWithDuration(0.7, delay: 1.0, options: .CurveEaseOut, animations: {
            self.popupView.frame = CGRect(x: 0, y: yPosition, width: self.screenSize.width, height: self.screenSize.width)
            }, completion: { finished in
        })
    }
    
    private func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CollectionVC.tapGestureAction))
        tapGesture.numberOfTapsRequired = 1
        popupView.addGestureRecognizer(tapGesture)
        popupView.userInteractionEnabled = true
    }
    
    @objc private func tapGestureAction() {
        makePopupViewVisible(false)
        print("TAPPED")
    }
}

// MARK: - UICollectionView

extension CollectionVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell : CollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        cell.delegate = self
        let photo = photos[indexPath.row]
        cell.index = indexPath.row
        
        cell.iconImageView.image = photo.smallImage
        imageManager.updatePhoto(photo, withImageSize: .Small, completion: {
            dispatch_async(dispatch_get_main_queue(), { 
                cell.iconImageView.image = photo.smallImage
            })
        })
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        selectedPhoto = photos[indexPath.row]
        performSegueWithIdentifier("modalViewSegue", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "modalViewSegue" {
            if let vc = segue.destinationViewController as? ModalVC {
                vc.photo = selectedPhoto
            }
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let itemsInRow: CGFloat = 3
        let padding: CGFloat = 15
        let screenSize = UIScreen.mainScreen().bounds
        let itemWidth = screenSize.width / itemsInRow - padding
        
        return CGSizeMake(itemWidth, itemWidth)
    }
    
    func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        let photo = photos[indexPath.row]
        print("item \(photo.id) became invisible ")

        let key = photo.smallImageURL ?? ""
        DownloadManager.shared.cancelDownloadIfPossible(key)
    }
}

extension CollectionVC: ImageInfoDelegate {
    
    func infoAboutPhoto(index: Int) {
        selectedPhoto = photos[index]
        
        makePopupViewVisible(true)
    }
}
