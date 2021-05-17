//
//  ViewController.swift
//  本地通知
//
//  Created by student on 2021/5/17.
//

import UIKit
import UserNotifications
import CoreLocation
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let content = UNMutableNotificationContent()
        content.title = "FBI WARNING"
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "do1.wav"))
        content.subtitle = "警告"
        content.body = "律师函警告"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        var compents = DateComponents()
        compents.year = 2021
        compents.day = 17
        compents.month = 5
        compents.hour = 9
        compents.minute = 29
        compents.second = 40
        let trigger2 = UNCalendarNotificationTrigger(dateMatching: compents, repeats: true)
        
        let region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 31.29888888, longitude: 118.2929292), radius: 100, identifier: "aaa")
        
        let trigger3 = UNLocationNotificationTrigger(region: region, repeats: false)
        
        let request = UNNotificationRequest(identifier: "abc", content: content, trigger: trigger2)
        UNUserNotificationCenter.current().add(request) { (errpr) in
            print("通知已发送")
        }
    }
}

