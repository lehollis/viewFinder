//
//  AddPhotoViewController.swift
//  viewFinder
//
//  Created by Maeve Thompson on 7/16/19.
//  Copyright © 2019 Maeve Thompson. All rights reserved.
//

import UIKit

class AddPhotoViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    
    
    @IBAction func cameraTapped(_ sender: UIButton) {
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func libraryTapped(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func captionText(_ sender: Any) {
    }
    
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            let photoToSave = Photos(entity: Photos.entity(), insertInto: context)
            
            photoToSave.caption = captionText.text
            
            if let userImage = newImageView.image {
                if let userImageData = userImage.pngData() {
                    photoToSave.imageData = userImageData
                }
            }
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            
            navigationController?.popViewController(animated: true)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {imageView.image = selectedImage}
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
}
