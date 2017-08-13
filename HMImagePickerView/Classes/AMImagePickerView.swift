//
//  ImagePickerView.swift
//  HMImagePickerViewExample
//
//  Created by HMSPL on 13/08/17.
//  Copyright © 2017 hakunamatata. All rights reserved.
//

import UIKit

public class AMImagePickerView: UIView {

    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var btnPicker: UIButton!
    @IBOutlet var imageView : UIImageView!
    public var viewcontroller : UIViewController!
    let picker = UIImagePickerController()
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        let bundle = Bundle(for: AMImagePickerView.self)
        if let view = bundle.loadNibNamed("AMImagePickerView", owner: self, options: nil)?.first as? UIView {
            view.backgroundColor = UIColor.clear
            let frame = self.bounds
            view.frame = frame
            self.addSubview(view)
            
            imageView.contentMode = UIViewContentMode.scaleAspectFill
            
            
        }
        
        btnClose.layer.cornerRadius = 15
        btnClose.clipsToBounds = true
        
        btnClose.isHidden = true
        picker.delegate = self
        // Initialization code
    }
    
    public func photoFromLibrary() {
        if let controller = viewcontroller {
            picker.allowsEditing = false
            picker.sourceType = .photoLibrary
            picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            controller.present(picker, animated: true, completion: nil)
        }
    }
    
    public func shootPhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
             if let controller = viewcontroller {
                picker.allowsEditing = false
                picker.sourceType = UIImagePickerControllerSourceType.camera
                picker.cameraCaptureMode = .photo
                picker.modalPresentationStyle = .fullScreen
                controller.present(picker,animated: true,completion: nil)
            }
        }else {
            noCamera()
        }
    }
    

    public func noCamera(){
           if let controller = viewcontroller {
        let alertVC = UIAlertController(
            title: "No Camera",
            message: "Sorry, this device has no camera",
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.default,
            handler: nil)
        alertVC.addAction(okAction)
        controller.present(
            alertVC,
            animated: true,
            completion: nil)
        }
    }
    
    @IBAction func closeAction(_ sender: AnyObject) {
        self.removeFromSuperview()
    }
    
    
    @IBAction func pickerAction(_ sender: AnyObject) {
        let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: "Please select", message: "Option to select", preferredStyle: .actionSheet)
        
        let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            
        }
        actionSheetControllerIOS8.addAction(cancelActionButton)
        
        let libraryAction = UIAlertAction(title: "Library", style: .default)
        { _ in
           self.photoFromLibrary()
        }
        actionSheetControllerIOS8.addAction(libraryAction)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default)
        { _ in
            self.shootPhoto()
        }
        actionSheetControllerIOS8.addAction(cameraAction)
        if let contoller = self.viewcontroller {
            contoller.present(actionSheetControllerIOS8, animated: true, completion: nil)
        }
    }
}


extension AMImagePickerView : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
     public func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
//        imageView.contentMode = .scaleAspectFit //3
        imageView.image = chosenImage //4
        viewcontroller.dismiss(animated:true, completion: nil) //5
        btnClose.isHidden = false

    }
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        viewcontroller.dismiss(animated: true, completion: nil)
    }
}
