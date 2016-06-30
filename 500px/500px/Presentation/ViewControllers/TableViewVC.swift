//
//  TableViewVC.swift
//  500px
//
//  Created by KhrystynaShevchuk on 6/14/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import Foundation
import UIKit

class TableViewVC: UIViewController {
    
    @IBOutlet weak var tableViewImageCollect: UITableView!
    
    let photosApi = PhotosAPI()
    let imageManager = ImageManager()
    var selectedPhoto : Photo?
    var indexOfImageView: Int = 0
    
    private let reuseIdentifier = "CustomImagesCell"
    
    var photos = [Photo]() {
        didSet {
            dispatch_async(dispatch_get_main_queue(), {
                self.tableViewImageCollect.reloadData()
            })
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        tableViewReloadData()
        
    }
    
    // MARK: - Private
    
    private func loadData() {
        photosApi.downloadPhotos { (photos) in
            self.photos = photos
        }
    }
    
    private func tableViewReloadData() {
        tableViewImageCollect.delegate = self
        tableViewImageCollect.dataSource = self
        tableViewImageCollect.rowHeight = CustomImagesCell.cellHeight()
        tableViewImageCollect.registerNib(UINib(nibName: reuseIdentifier, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
}

     //  MARK: - UITableView

extension TableViewVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = ceil(CGFloat(photos.count) / CGFloat(imageViewCount))
        return Int(count)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: CustomImagesCell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CustomImagesCell
        cell.delegate = self
        
        let currentIndex = indexPath.row * imageViewCount
        for index in 0..<imageViewCount {
            let imageView = cell.imageViews[index]
            let verifyIndex = currentIndex + index
            cell.index = verifyIndex

            if verifyIndex < photos.count {
                let photo = photos[verifyIndex]
                indexOfImageView = index
                imageManager.updatePhoto(photo, withImageSize: .Small, completion: {
                    dispatch_async(dispatch_get_main_queue(), {
                        imageView.image = photo.smallImage
                    })
                })
                imageView.image = photo.smallImage
            } else {
                cell.imageViews[index].image = nil
            }
        }
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "modalViewSegueFromCell" {
            if let vc = segue.destinationViewController as? ModalVC {
                vc.photo = selectedPhoto
            }
        }
    }
}

extension TableViewVC: ImagePickerDelegate {
    
    func selectedImage(index: Int) -> Void {
        selectedPhoto = photos[index]
        
        performSegueWithIdentifier("modalViewSegueFromCell", sender: nil)
    }
}
