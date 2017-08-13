//
//  ViewController.swift
//  HMImagePickerView
//
//  Created by anumothuR on 08/13/2017.
//  Copyright (c) 2017 anumothuR. All rights reserved.
//

import UIKit
import HMImagePickerView

class ViewController: UIViewController {

    @IBOutlet weak var chooseImageView: AMImagePickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        chooseImageView.viewcontroller = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

