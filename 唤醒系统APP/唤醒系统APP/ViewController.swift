//
//  ViewController.swift
//  唤醒系统APP
//
//  Created by student on 2021/5/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let phone = "itms-apps://itunes.apple.com/app/id12345678"
        let url = URL(string: phone)
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        tel()
    }


}
extension ViewController{
    func tel() {
        let phone = "Aapp://"
        let url = URL(string: phone)
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    func sms() {
        let phone = "sms://18888888888"
        let url = URL(string: phone)
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    func email() {
        let phone = "mailto://18888888888"
        let url = URL(string: phone)
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
}

