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
    let imagePickerController = UIImagePickerController()

    @IBOutlet weak var imageview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cameraPermissionCheck()
        photoPermissionCheck()
        

    }
    
    @IBAction func camera(_ sender: Any) {
        imagePickerController.sourceType = .camera
        imagePickerController.allowsEditing = true
        imagePickerController.cameraDevice = .rear
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    @IBAction func photo(_ sender: Any) {
        
        imagePickerController.sourceType = .photoLibrary
            imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true, completion: nil)
        imagePickerController.delegate = self

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
extension ViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] {
            self.imageview.image = image as! UIImage
        }
        imagePickerController.dismiss(animated: true, completion: nil)
    }
    
}
