//
//  ViewController.swift
//  TableViewCell轮播
//
//  Created by student on 2020/1/3.
//  Copyright © 2020 abc. All rights reserved.
//

import AVFoundation
import Photos
import UIKit


extension ViewController: AVCaptureMetadataOutputObjectsDelegate {
    // 扫描到了就会回调该方法
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        var result: String?

        if metadataObjects.count > 0 {
            let metadataObject = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
            // 获取内容
            result = metadataObject.stringValue
            if let result = result {
                session.stopRunning()
                // 输出结果
                let alertController = UIAlertController(title: "二维码扫描结果", message: result, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
                    self.preview.removeFromSuperlayer()
                })
                alertController.addAction(okAction)
               
                present(alertController, animated: true, completion: nil)
            }
        }
    }
}

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var device: AVCaptureDevice!
    var input: AVCaptureDeviceInput!
    var output: AVCaptureMetadataOutput!
    var session: AVCaptureSession!
    var preview: AVCaptureVideoPreviewLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        checkPermission1()
        checkPermission2()
    }

    @IBAction func useCamera(_ sender: Any) {
        // 1. 实例化拍摄设
        device = AVCaptureDevice.default(for: .video)
        // 2. 设置输入设备
        input = try! AVCaptureDeviceInput(device: device!)
        // 3. 设置元数据输出
        output = AVCaptureMetadataOutput()
        // 4. 设置代理 获取扫描后的结果
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        // 5. 添加拍摄会话
        session = AVCaptureSession()
        session.addInput(input)
        session.addOutput(output)
        session.sessionPreset = AVCaptureSession.Preset.high
        // 设置输出数据类型，需要将元数据输出添加到会话后，才能指定元数据类型，否则会报错
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        // 6. 视频预览图层
        preview = AVCaptureVideoPreviewLayer(session: session)
        preview.videoGravity = AVLayerVideoGravity.resizeAspectFill
        preview.frame = view.bounds
        view.layer.insertSublayer(preview, at: 0)
        // 7. 启动会话
        session.startRunning()
    }
}

extension ViewController {
    // 检查权限
    func checkPermission1() {
        AVCaptureDevice.requestAccess(for: .video) { granted in
            if !granted {
                print("不同意授权")
            } else {
                print("同意授权")
            }
        }
    }
}

extension ViewController {
    // 检查权限
    func checkPermission2() {
        if #available(iOS 14, *) {
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
                switch status {
                case .limited:
                    print("限制访问")
                case .denied, .restricted:
                    print("拒绝")
                case .authorized:
                    print("完全访问")
                default: ()
                }
            }
        } else {
            PHPhotoLibrary.requestAuthorization { status in
                switch status {
                case .denied, .restricted:
                    print("拒绝")
                case .authorized:
                    print("完全访问")
                default: ()
                }
            }
        }
    }
}
