//
//  ViewController.swift
//  Audio
//
//  Created by student on 2021/4/25.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func avbutton(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            playsound(name: "do1")
        case 2:
            playsound(name: "la6")
        case 3:
            playsound(name: "sol5")
        case 4:
            playsound(name: "mi3")
        case 5:
            playsound(name: "re2")
        case 6:
            playsound(name: "fa4")
        case 7:
            playsound(name: "si7")
        default:
            print("error")
        }
        
    }
    
    func playsound(name:String) {
        var soundID:SystemSoundID = 0
        
        let soundUrl = Bundle.main.url(forResource: name, withExtension: "wav")
        if let soundUrl = soundUrl {
            AudioServicesCreateSystemSoundID(soundUrl as CFURL, &soundID)
            AudioServicesPlaySystemSound(soundID)
        }
        
    }
}

