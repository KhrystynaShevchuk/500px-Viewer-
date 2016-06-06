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
    
    var photos = [Photo]()
    let photosApi = PhotosAPI()
    var editModeEnabled = false
    
    private let reuseIdentifier = "CollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photosApi.downloadPhotos { (photos) in
            self.photos = photos
            
           dispatch_async(dispatch_get_main_queue(), { 
                self.photosCollectionView.reloadData()
           })
        }
    }
}

extension CollectionVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let  cell : CollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        
        let photo = photos[indexPath.row]
        cell.iconImageView.image = photo.image
        DownloadManager.shared.startDownload(photo) {
            dispatch_async(dispatch_get_main_queue(), { 
                cell.iconImageView.image = photo.image
            })
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let screenSize = UIScreen.mainScreen().bounds
        let itemWidth = screenSize.width / 3 - 15
        return CGSizeMake(itemWidth, itemWidth)
    }
    
    func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        	
        let photo = photos[indexPath.row]
        print("item \(photo.id) became invisible ")
    }
}