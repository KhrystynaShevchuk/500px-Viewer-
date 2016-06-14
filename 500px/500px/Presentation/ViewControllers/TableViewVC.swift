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
    
    var photos = [Photo]() {
        didSet {
            dispatch_async(dispatch_get_main_queue(), {
                self.tableViewImageCollect.reloadData()
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        tableViewImageCollect.delegate = self
        tableViewImageCollect.dataSource = self
        tableViewImageCollect.rowHeight = UITableViewAutomaticDimension
        tableViewImageCollect.registerNib(UINib(nibName: "CustomImagesCell", bundle: nil), forCellReuseIdentifier: "CustomImagesCell")
        
        tableViewImageCollect.reloadData()
    }
    
    private func loadData() {
        photosApi.downloadPhotos { (photos) in
            self.photos = photos
        }
    }

    
}

extension TableViewVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: CustomImagesCell = tableView.dequeueReusableCellWithIdentifier("CustomImagesCell", forIndexPath: indexPath) as! CustomImagesCell

        var photo = photos[indexPath.row]
        cell.imageView1?.image = photo.smallImage
        cell.imageView2?.image = photo.smallImage
        cell.imageView3?.image = photo.smallImage

        
        return cell
    }
}
