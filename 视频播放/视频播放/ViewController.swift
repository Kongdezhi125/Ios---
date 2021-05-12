//
//  ViewController.swift
//  视频播放
//
//  Created by 马李军 on 2021/5/10.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playRemote()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        playLocal()
    }

    func playLocal(){
        let url = Bundle.main.url(forResource: "test", withExtension: "mp4")!
        let avplayer = AVPlayer(url: url)
        
        let playerController = AVPlayerViewController()
        playerController.player = avplayer
        
        present(playerController, animated: true, completion: nil)
    }
    
    func playRemote(){
        let url = URL(string: "http://172.20.53.240:8080/AppTestAPI/test.mp4")!
        let avplayer = AVPlayer(url: url)
        
        let playerController = AVPlayerViewController()
        playerController.player = avplayer
        
        playerController.view.frame = CGRect(x: 0, y: 10, width: view.bounds.size.width, height: 260)
        
        self.addChild(playerController)
        self.view.addSubview(playerController.view)
        
    }

}

