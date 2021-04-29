//
//  ViewController.swift
//  AVPlayer
//
//  Created by student on 2021/4/29.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var initTime: UILabel!
    @IBOutlet weak var overTime: UILabel!
    @IBOutlet weak var slide: UISlider!
    var player:AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        player = createPlayer()
    }
    var music = ["http://172.20.53.240:8080/AppTestAPI/music1.mp3","http://172.20.53.240:8080/AppTestAPI/music2.mp3","http://172.20.53.240:8080/AppTestAPI/music3.mp3"]
    var index = 0
    
    func createPlayer() -> AVPlayer {
        let url = URL(string: music[0])
        let item = AVPlayerItem(url: url!)
        
        let play = AVPlayer(playerItem: item)
        let duration:CMTime = item.asset.duration
        let totalTime:Float = CMTimeGetSeconds(duration)
        player?.addPeriodicTimeObserver(forInterval: CMTimema, queue: <#T##DispatchQueue?#>, using: <#T##(CMTime) -> Void#>)
        
        
        return play
    }

    @IBAction func perviousSong(_ sender: Any) {
        index -= 1
        if index < 0 {
            index = music.count - 1
        }
        
        let url = URL(string: music[index])
        player?.replaceCurrentItem(with: AVPlayerItem(url: url!))
        
    }
    
    @IBAction func isPlaySong(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            player?.play()
        }
        else{
            player?.pause()
        }
        
    }
    @IBAction func isNextSong(_ sender: Any) {
        index += 1
        if index > 3{
            index = 0
        }
        
        let url = URL(string: music[index])
        player?.replaceCurrentItem(with: AVPlayerItem(url: url!))
    }
}

