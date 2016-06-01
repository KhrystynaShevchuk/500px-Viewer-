//
//  CollectionVC1.swift
//  500px
//
//  Created by KhrystynaShevchuk on 6/1/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import UIKit

class CollectionVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var photosCollectionView: UICollectionView!
    
    var photos = [Photo]()
    
    private let reuseIdentifier = "CollectionViewCell"
    //    private let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 20.0, right: 10.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        
        return cell
    }
}
