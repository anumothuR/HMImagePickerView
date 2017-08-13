# HMImagePickerView

[![CI Status](http://img.shields.io/travis/anumothuR/HMImagePickerView.svg?style=flat)](https://travis-ci.org/anumothuR/HMImagePickerView)
[![Version](https://img.shields.io/cocoapods/v/HMImagePickerView.svg?style=flat)](http://cocoapods.org/pods/HMImagePickerView)
[![License](https://img.shields.io/cocoapods/l/HMImagePickerView.svg?style=flat)](http://cocoapods.org/pods/HMImagePickerView)
[![Platform](https://img.shields.io/cocoapods/p/HMImagePickerView.svg?style=flat)](http://cocoapods.org/pods/HMImagePickerView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

* Xcode 8 and above,
* iOS 8 and above
Swift 3

## Installation

HMImagePickerView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "HMImagePickerView"
```

## Usage

Before using this component, We need to set two privacy settings in info.plist. 

* Privacy - Photo Library Usage Description
* Privacy - Camera Usage Description

Kindly give the necessary message why we are need to use camara and photo library. 

1. I have added some base code how we can use this component. Import the framework. 

```ruby
import HMImagePickerView
```

2. Add a UIView in you xib respective viewcontoller. Change the class name of the UIView to "AMImagePickerView".
Create a reference in your view controller

```ruby
   @IBOutlet weak var chooseImageView: AMImagePickerView!
```

3. Set the view controller, which one we need to present the camera or Photo Library. 

```ruby
 chooseImageView.viewcontroller = self
```

Thats all!!!! here you go. Just run your app. :) See the magic. 


## Author

anumothuR, anumothu911@gmail.com

## License

HMImagePickerView is available under the MIT license. See the LICENSE file for more info.
