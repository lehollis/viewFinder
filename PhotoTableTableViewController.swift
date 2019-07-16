//
//  PhotoTableViewController.swift
//  viewFinder
//
//  Created by Maeve Thompson on 7/16/19.
//  Copyright © 2019 Maeve Thompson. All rights reserved.
//

import UIKit

class PhotoTableTableViewController: UITableViewController {
    
    var photos : [Photos] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getPhotos() {
            
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
        if let coreDataPhotos = try? context.fetch(Photos.fetchRequest()) as? [Photos] {
                    photos = coreDataPhotos
                    tableView.reloadData()
                }
            }
        }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        getPhotos()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let cellPhoto = photos[indexPath.row]
        
        cell.textLabel?.text = cellPhoto.caption
        
        if let cellPhotoImageData = cellPhoto.imageData {
            if let cellPhotoImage = UIImage(data: cellPhotoImageData) {
                cell.imageView?.image = cellPhotoImage
            }
        }
        
        return cell
    }
}

