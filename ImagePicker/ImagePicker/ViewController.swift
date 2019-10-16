//
//  ViewController.swift
//  ImagePicker
//
//  Created by Basith on 16/10/19.
//  Copyright © 2019 TechPro. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var imgview: UIImageView!
    let picker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        picker.delegate = self
    }
    
    @IBAction func FromLib(_ sender: Any) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        picker.modalPresentationStyle = .popover
        present(picker, animated: true, completion: nil)
        picker.popoverPresentationController?.barButtonItem = sender as? UIBarButtonItem
        
    }
    
    @IBAction func FromCam(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("media picking")
            picker.allowsEditing = false
            picker.sourceType = UIImagePickerController.SourceType.camera
            picker.cameraCaptureMode = .photo
            picker.modalPresentationStyle = .fullScreen
            present(picker, animated: true, completion: nil)
        }else{
            print("no camera")
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        UIImageWriteToSavedPhotosAlbum(chosenImage, self, nil, nil)
        imgview.contentMode = .scaleAspectFit
        imgview.image = chosenImage
        dismiss(animated: true, completion: nil)
    }
    


}

