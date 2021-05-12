//
//  ViewController.swift
//  Record
//
//  Created by student on 2021/5/12.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var play:AVAudioPlayer?
    var record : AVAudioRecorder?
    
    let filePath = NSHomeDirectory()+"/Documents/new1.caf"

    override func viewDidLoad() {
        super.viewDidLoad()
        print("NSHomedirectry+\(NSHomeDirectory())")
        // Do any additional setup after loading the view.
        let recorderSettings:[String:Any] = [
            AVFormatIDKey:NSNumber(value: kAudioFormatMPEG4AAC),//录音格式：
            AVNumberOfChannelsKey:2,//音频声道，立体声为双声道
            AVEncoderAudioQualityKey:AVAudioQuality.max.rawValue,
            AVEncoderBitRateKey:320000,//音频的编码比特率
            AVSampleRateKey:44100.0//采样速率
        ]
        AVAudioSession.sharedInstance().requestRecordPermission { (granted) in
            if granted{
                print("授权成功")
            }
            else{
                print("授权失败")
            }
        }
        
        record = try? AVAudioRecorder(url: URL(fileURLWithPath: filePath), settings: recorderSettings)
//        record?.addObserver(<#T##observer: NSObject##NSObject#>, forKeyPath: <#T##String#>, options: <#T##NSKeyValueObservingOptions#>, context: <#T##UnsafeMutableRawPointer?#>)
    }


    @IBAction func record(_ sender: Any) {
        record?.record()
        
    }
    @IBAction func play(_ sender: Any) {
        play = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: filePath))
        play?.play()
    }
    
    @IBAction func pause(_ sender: Any) {
        record?.pause()
    }
}

