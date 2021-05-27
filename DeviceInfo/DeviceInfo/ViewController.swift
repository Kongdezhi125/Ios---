//
//  ViewController.swift
//  DeviceInfo
//
//  Created by student on 2021/5/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func getDeviceInfo() {
        let appName = Bundle.main.infoDictionary!["CFBundleName"]
        let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"]
        
        let ios = UIDevice.current.name
        let systemName = UIDevice.current.systemName
        let systemVersion = UIDevice.current.systemVersion
        let localizedModel = UIDevice.current.localizedModel
        
        print("\(appName)--\(appVersion)--\(ios)--\(systemName)--\(systemVersion)--\(localizedModel)")
        
    }

}

