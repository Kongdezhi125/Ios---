//
//  ViewController.swift
//  相机与相册
//
//  Created by student on 2021/5/12.
//

import UIKit
import AVFoundation
import Photos

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cameraPermissionCheck()
        photoPermissionCheck()
    }
    func cameraPermissionCheck() {
        AVCaptureDevice.requestAccess(for: .video) { (granted) in
            if granted{
                print("授权成功")
            }
            else{
                print("授权失败")
            }
        }
    }
    func photoPermissionCheck() {
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { (status) in
            switch status{
            case .authorized:
                print("完全访问")
            case .denied,.notDetermined,.restricted:
                print("不允许访问")
            case .limited:
                print("有限访问")
            }
        }
    }


}

