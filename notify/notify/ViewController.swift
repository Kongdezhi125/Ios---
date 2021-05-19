//
//  ViewController.swift
//  本地通知
//
//  Created by 马李军 on 2021/5/17.
//

import UIKit
import UserNotifications
import CoreLocation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setActions()
        NotificationCenter.default.addObserver(self, selector: #selector(handled), name: UIApplication.userDidTakeScreenshotNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(capture(notifation:)), name: UIScreen.capturedDidChangeNotification, object: nil)
    }
    @objc func handled(){
        print("截屏成功")
    }
    @objc func capture(notifation:Notification){
        let snapView = UIView(frame: UIScreen.main.bounds)
        snapView.backgroundColor = .red
        self.view.addSubview(snapView)
        
        let screen = notifation.object as! UIScreen
        if screen.isCaptured {
            print("正在录制")
        }
        else{
            print("停止录制")
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let content = UNMutableNotificationContent()
        content.title = "通知标题"
        content.subtitle = "通知副标题"
        content.sound = UNNotificationSound(named: UNNotificationSoundName("do1.wav"))
        content.body = "今天是2020年5月17日，星期一，晴"
        content.badge = 1
        content.userInfo = ["Username":"MaLijun"]
        let sound = Bundle.main.url(forResource: "do1.wav", withExtension: nil)
        let att = try! UNNotificationAttachment(identifier: "sound", url: sound!, options: nil)
        content.attachments = [att]
        
        content.categoryIdentifier = "abc"
        // 一段时间后触发
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        //通过日期推送
        var conmponents = DateComponents()
        conmponents.year = 2021
        conmponents.month = 5
        conmponents.day = 17
        conmponents.hour = 9
        conmponents.minute = 12
        conmponents.second = 30
        
        let trigger2 = UNCalendarNotificationTrigger(dateMatching: conmponents, repeats: false)
        
        //根据位置通知
        let region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 31.2906511800, longitude: 118.3623587000), radius: 100, identifier: "abc")
        region.notifyOnEntry = true
        region.notifyOnExit = true
        
        let trigger3 = UNLocationNotificationTrigger(region: region, repeats: false)
        
        let request = UNNotificationRequest(identifier: "abc", content: content, trigger: trigger)
        
        
        UNUserNotificationCenter.current().add(request) { error in
            print("通知已发送")
            content.badge = 1
        }
    }
    
}
extension ViewController{
    func setActions() {
        var action1 =  UNNotificationAction(identifier: "action1", title: "相机", options: .foreground)
        var action2 = UNTextInputNotificationAction(identifier: "action2", title: "回复", options: .authenticationRequired, textInputButtonTitle: "OK", textInputPlaceholder: "请输入回复内容")
        let category = UNNotificationCategory(identifier: "abc", actions: [action1,action2], intentIdentifiers: [],options: .customDismissAction)
        UNUserNotificationCenter.current().setNotificationCategories([category])
    }
    
}
