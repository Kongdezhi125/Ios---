//
//  ViewController.swift
//  debug和release
//
//  Created by student on 2021/6/9.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let server_URL = Bundle.main.object(forInfoDictionaryKey: "server_URL")
        print(server_URL)
        
        
        //proect里面的buildingsettings下面的customflags
        #if APPDEBUG
        print("this is debug")
        #endif
        
        #if APPRELEASE
        print("this is release")
        #endif
    }


}

